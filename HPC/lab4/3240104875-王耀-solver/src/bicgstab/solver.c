#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>
#include <immintrin.h>

int start,end,local_N;

void gemv(double* __restrict y, double* __restrict A, double* __restrict x, int N) {
    // y = A * x
    
    #pragma omp parallel
    {
        __m512d a,b,c;
        #pragma omp for
        for (int i = 0; i < local_N; i++) {
            
            y[i] = 0.0;
            c = _mm512_setzero_pd();
            for (int j = 0; j + 8 < N; j += 8) {
                /*if(j + 8 > N) {
                    #pragma omp simd
                    for (int k = j; k < N; k++) {
                        y[i] += A[i * N + k] * x[k];
                    }
                }
                else{*/
                    a = _mm512_loadu_pd(A + i * N + j);
                    b = _mm512_loadu_pd(x + j);
                    c = _mm512_fmadd_pd(a, b, c);
                    
                //}
            }
            y[i] += _mm512_reduce_add_pd(c);
            #pragma omp simd reduction(+:y[i])
            for(int k = N/8*8; k < N; k++) 
                y[i] += A[i * N + k] * x[k];
        }
    }
}

/*double dot_product_ref(double* __restrict x, double* __restrict y, int N) {
    // dot product of x and y
    double result = 0.0;
    #pragma omp parallel for simd reduction(+:result)
    for (int i = 0; i < N; i++) {
        result += x[i] * y[i];
    }
    return result;
}*/

double dot_product(double* __restrict x, double* __restrict y, int N) {
    // dot product of x and y
    double result = 0.0;
    //#pragma omp parallel for simd reduction(+:result)
    #pragma omp parallel reduction(+:result)
    {
        //__m512d a,b,c;
        #pragma omp for
        for (int i = 0; i < N; i += 8) {
            //result += x[i] * y[i];
            //c = _mm512_setzero_pd();
            if(i + 8 > N) {
                #pragma omp simd
                for (int k = i; k < N; k++) {
                    result += x[k] * y[k];
                }
            }
            else {
                /*a = _mm512_loadu_pd(x + i);
                b = _mm512_loadu_pd(y + i);
                c = _mm512_fmadd_pd(a, b, c);*/
                result += _mm512_reduce_add_pd(_mm512_mul_pd(_mm512_loadu_pd(x + i), _mm512_loadu_pd(y + i)));
            }
            //result += _mm512_reduce_add_pd(c);
        }
        
    }
    return result;
}

void precondition(double* __restrict A, double* __restrict K2_inv, int N) {
    // K2_inv = 1 / diag(A)
    #pragma omp parallel for
    for (int i = 0; i < local_N; i++) {
        K2_inv[i] = 1.0 / A[i * N + i + start];
    }
}

void precondition_apply(double* __restrict z, double* __restrict K2_inv, double* __restrict r, int N) {
    // z = K2_inv * r
    //#pragma omp parallel for simd
    #pragma omp parallel
    {
        #pragma omp for
        for (int i = 0; i < N; i += 8) {
            //z[i] = K2_inv[i] * r[i];
            if(i + 8 > N) {
                #pragma omp simd
                for (int k = i; k < N; k++) {
                    z[k] = K2_inv[k] * r[k];
                }
            }
            else{ 
                /*a = _mm512_loadu_pd(K2_inv + i);
                b = _mm512_loadu_pd(r + i);
                c = _mm512_mul_pd(a, b);
                _mm512_storeu_pd(z + i, c);*/
                _mm512_storeu_pd(z + i, _mm512_mul_pd(_mm512_loadu_pd(K2_inv + i), _mm512_loadu_pd(r + i)));
            }
            
        }
    }
}

int bicgstab(int N, double* A, double* b, double* x, int max_iter, double tol) {
    /**
     * Algorithm: BICGSTAB
     *  r: residual
     *  r_hat: modified residual
     *  p: search direction
     *  K2_inv: preconditioner (We only store the diagonal of K2_inv)
     * Reference: https://en.wikipedia.org/wiki/Biconjugate_gradient_stabilized_method
     */
    int rank,size;
    int flag = 0;
    //int start,end;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Bcast(&N, 1, MPI_INT, 0, MPI_COMM_WORLD);
    local_N = N / size + (rank < N % size ? 1 : 0); // Handle uneven distribution
    double* r      = (double*)calloc(local_N, sizeof(double));
    double* r_hat  = (double*)calloc(local_N, sizeof(double));
    double* p      = (double*)calloc(local_N, sizeof(double));
    double* v      = (double*)calloc(local_N, sizeof(double));
    double* s      = (double*)calloc(local_N, sizeof(double));
    double* h      = (double*)calloc(local_N, sizeof(double));
    double* t      = (double*)calloc(local_N, sizeof(double));
    double* y      = (double*)calloc(N, sizeof(double));
    double* z      = (double*)calloc(N, sizeof(double));
    double* x_t    = (double*)calloc(local_N, sizeof(double));
    double* y_t    = (double*)calloc(local_N, sizeof(double));
    double* z_t    = (double*)calloc(local_N, sizeof(double));
    double* K2_inv = (double*)calloc(local_N, sizeof(double));

    double rho_old = 1, alpha = 1, omega = 1;
    double rho = 1, beta = 1;
    double tol_squared = tol * tol;
    __m512d bdc,bdd;
    
    start = rank * (N / size) + (rank < N % size ? rank : N % size);
    end = start + local_N;
    // Take M_inv as the preconditioner
    // Note that we only use K2_inv (in wikipedia)
    int *counts_send = (int*)malloc(size * sizeof(int));
    int *displacements = (int*)malloc(size * sizeof(int));
    //if(!rank){
        for (int i = 0; i < size; i++) {
            counts_send[i] = ((N / size) + (i < N % size ? 1 : 0)) * N;
            displacements[i] = (i * (N / size) + (i < N % size ? i : N % size)) * N;
            // printf("%d %d %d %d\n", counts_send[i]/N, displacements[i]/N,rank,i);
        }
    //}
    if(rank){
        A = (double*)malloc(local_N * N * sizeof(double));
        b = (double*)malloc(N * sizeof(double));
        x = (double*)malloc(N * sizeof(double));
    }
    /*printf("Reach\n");
    if(local_N*N!=counts_send[rank]){
        printf("Error: local_N*N != counts_send[rank] (%d != %d) on rank %d\n", local_N*N, counts_send[rank], rank);
        MPI_Abort(MPI_COMM_WORLD, 1); // 直接终止，避免死锁
    }
    MPI_Barrier(MPI_COMM_WORLD); // 调试用，同步所有进程
    // 打印调试信息
    for (int i = 0; i < size; i++) {
        printf("Rank %d: counts_send[%d]=%d, displacements[%d]=%d\n", rank, i, counts_send[i], i, displacements[i]);
    }
    printf("Rank %d: local_N=%d, local_N*N=%d\n", rank, local_N, local_N*N);
    fflush(stdout);
    MPI_Barrier(MPI_COMM_WORLD);

    printf("Rank %d: before MPI_Scatterv\n", rank); fflush(stdout);
    MPI_Barrier(MPI_COMM_WORLD);*/

    if(!rank)
        MPI_Scatterv(A, counts_send, displacements, MPI_DOUBLE, MPI_IN_PLACE, local_N*N, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    else
        MPI_Scatterv(NULL, counts_send, displacements, MPI_DOUBLE, A, local_N*N, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    /*printf("Rank %d: after MPI_Scatterv\n", rank); fflush(stdout);
    MPI_Barrier(MPI_COMM_WORLD);*/
    MPI_Bcast(b, N, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    MPI_Bcast(x, N, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    for(int i = 0; i < size; i++){
        counts_send[i] = (N / size) + (i < N % size ? 1 : 0);
        displacements[i] = i * (N / size) + (i < N % size ? i : N % size);
    }
    precondition(A, K2_inv, N);

    // 1. r0 = b - A * x0
    gemv(r, A, x, N);
    #pragma omp parallel for simd
    for (int i = 0; i < local_N; i++) {
        r[i] = b[start+i] - r[i];
    }
    //printf("Reach\n");
    // 2. Choose an arbitary vector r_hat that is not orthogonal to r
    // We just take r_hat = r, please do not change this initial value
    memmove(r_hat, r, local_N * sizeof(double));  // memmove is safer memcpy :)

    // 3. rho_0 = (r_hat, r)
    double t1 = dot_product(r_hat, r, local_N), t_sum;
    MPI_Reduce(&t1, &rho, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    MPI_Bcast(&rho, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    // 4. p_0 = r_0
    memmove(p, r, local_N * sizeof(double));

    int iter;
    for (iter = 1; iter <= max_iter; iter++) {
        flag = 0; // 每次循环都初始化
        
        if (iter % 1000 == 0) {
            t1 = dot_product(r, r, local_N);
            //printf("%e %d\n", t1, rank);
            MPI_Reduce(&t1, &t_sum, 1, MPI_DOUBLE, MPI_SUM, size-1, MPI_COMM_WORLD);
            
            if(rank == size - 1) {
                /*printf("%e\n",t_sum);
                if(t_sum<0) printf("Negative residual detected!\n");*/
                printf("Iteration %d, residul = %e\n", iter, sqrt(t_sum));
            }
        }
        //printf("reach 1 %d\n", iter);
        // 1. y = K2_inv * p (apply preconditioner)
        precondition_apply(y_t, K2_inv, p, local_N);
        MPI_Allgatherv(y_t, local_N, MPI_DOUBLE, y, counts_send, displacements, MPI_DOUBLE, MPI_COMM_WORLD);
        // 2. v = Ay
        gemv(v, A, y, N);

        // 3. alpha = rho / (r_hat, v)
        t1 = dot_product(r_hat, v, local_N);
        
        MPI_Reduce(&t1, &t_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        //if(!rank&&isnan(t_sum)) printf("iter %d\n", iter);
        if(!rank) alpha = rho / t_sum;
        MPI_Bcast(&alpha, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);

        bdc = _mm512_set1_pd(alpha);
    #pragma omp parallel
    {
        // 4. h = x_{i-1} + alpha * y
        #pragma omp for
        for (int i = 0; i < local_N; i += 8) {
            //h[i] = x[start+i] + alpha * y[start+i];
            if(i + 8 > local_N) {
                #pragma omp simd
                for (int k = i; k < local_N; k++) {
                    h[k] = x[start + k] + alpha * y[start + k];
                }
            }
            else{
                /*a = _mm512_loadu_pd(x + start + i);
                b = _mm512_loadu_pd(y + start + i);
                c = _mm512_fmadd_pd(bdc, b, a);
                _mm512_storeu_pd(h + i, c);*/
                _mm512_storeu_pd(h + i, _mm512_fmadd_pd(bdc, _mm512_loadu_pd(y + start + i), _mm512_loadu_pd(x + start + i)));
            }
        }

        // 5. s = r_{i-1} - alpha * v
        #pragma omp for
        for (int i = 0; i < local_N; i += 8) {
            //s[i] = r[i] - alpha * v[i];
            if(i + 8 > local_N) {
                #pragma omp simd
                for (int k = i; k < local_N; k++) {
                    s[k] = r[k] - alpha * v[k];
                }
            }
            else {
                /*a = _mm512_loadu_pd(r + i);
                b = _mm512_loadu_pd(v + i);
                c = _mm512_fmsub_pd(bdc, b, a);
                c = _mm512_sub_pd(_mm512_setzero_pd(), c); // Ensure no negative values
                _mm512_storeu_pd(s + i, c);*/
                _mm512_storeu_pd(s + i, _mm512_sub_pd(_mm512_loadu_pd(r + i), _mm512_mul_pd(bdc, _mm512_loadu_pd(v + i))));
            }
        }
    }
        // 6. Is h is accurate enough, then x_i = h and quit
        /*if (dot_product(s, s, N) < tol_squared) {
            memmove(x, h, N * sizeof(double));
            break;
        }*/
        //printf("reach 2 %d\n", iter);
        t1 = dot_product(s, s, local_N);
        MPI_Reduce(&t1, &t_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        if(!rank && t_sum < tol_squared) {
            memmove(x_t, h, local_N * sizeof(double));
            flag = 1;
        }

        MPI_Bcast(&flag, 1, MPI_INT, 0, MPI_COMM_WORLD);
        if(flag){
            MPI_Allgatherv(x_t, local_N, MPI_DOUBLE, x, counts_send, displacements, MPI_DOUBLE, MPI_COMM_WORLD);
            break;
        }
        //printf("reach tt %d %d %d\n", iter,rank,flag);
        // 7. z = K2_inv * s
        precondition_apply(z_t, K2_inv, s, local_N);
        MPI_Allgatherv(z_t, local_N, MPI_DOUBLE, z, counts_send, displacements, MPI_DOUBLE, MPI_COMM_WORLD);
        // 8. t = Az
        gemv(t, A, z, N);
        //printf("reach t %d\n", iter);
        // 9. omega = (t, s) / (t, t)
        t1 = dot_product(t, s, local_N);
        /*if(t1!=dot_product_ref(t, s, local_N)){
            printf("Dot product mismatch on rank %d at iteration %d: %e vs %e\n", rank, iter, t1, dot_product_ref(t, s, local_N));
            MPI_Abort(MPI_COMM_WORLD, 1); // 直接终止，避免死锁
        }*/
        double t2 = dot_product(t, t, local_N),t_sum2;
        MPI_Reduce(&t1, &t_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        MPI_Reduce(&t2, &t_sum2, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        if(!rank) {
            omega = t_sum / t_sum2;
            // if(isnan(omega)) {
            //     printf("NaN detected in omega at iteration %d on rank %d\n", iter, rank);
            // }
            
        }
        
        MPI_Bcast(&omega, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
        // if(!omega){
        //     if(!rank) printf("Breakdown: omega = 0 at iteration %d on rank %d\n", iter, rank);
        //     exit(1);
        // }
        bdc = _mm512_set1_pd(omega);
    #pragma omp parallel
    {
        //__m512d a,b,c;
        
        // 10. x_i = h + omega * z
        #pragma omp for
        for (int i = 0; i < local_N; i += 8) {
            //x_t[i] = h[i] + omega * z[start+i];
            if(i + 8 > local_N) {
                #pragma omp simd
                for (int k = i; k < local_N; k++) {
                    x_t[k] = h[k] + omega * z[start + k];
                }
            }
            else{
                /*a = _mm512_loadu_pd(h + i);
                b = _mm512_loadu_pd(z + i + start);
                c = _mm512_fmadd_pd(bdc, b, a);
                _mm512_storeu_pd(x_t + i, c);*/
                _mm512_storeu_pd(x_t + i, _mm512_fmadd_pd(bdc, _mm512_loadu_pd(z + start + i), _mm512_loadu_pd(h + i)));
            }
           
        }
    
        // 11. r_i = s - omega * t
        #pragma omp for
        for (int i = 0; i < local_N; i += 8) {
            //r[i] = s[i] - omega * t[i];
            if(i + 8 > local_N) {
                #pragma omp simd
                for (int k = i; k < local_N; k++) {
                    r[k] = s[k] - omega * t[k];
                }
            }
            else{
                /*a = _mm512_loadu_pd(s + i);
                b = _mm512_loadu_pd(t + i);
                c = _mm512_fmsub_pd(bdc, b, a);
                c = _mm512_sub_pd(_mm512_setzero_pd(), c); // Ensure no negative values
                _mm512_storeu_pd(r + i, c);*/
                _mm512_storeu_pd(r + i, _mm512_sub_pd(_mm512_loadu_pd(s + i), _mm512_mul_pd(bdc, _mm512_loadu_pd(t + i))));
            }
            
        }
    }
        //printf("reach 3 %d\n", iter);
        MPI_Allgatherv(x_t, local_N, MPI_DOUBLE, x, counts_send, displacements, MPI_DOUBLE, MPI_COMM_WORLD);
        // 12. If x_i is accurate enough, then quit
        t1 = dot_product(r, r, local_N);
        MPI_Reduce(&t1, &t_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        if(!rank && t_sum < tol_squared) {
            flag = 1;
            //memmove(&x[start], h, local_N * sizeof(double));
        }
        MPI_Bcast(&flag, 1, MPI_INT, 0, MPI_COMM_WORLD);
        if (flag){
            break;
        }
        //if (dot_product(r, r, N) < tol_squared) break;

        rho_old = rho;
        // 13. rho_i = (r_hat, r)
        t1 = dot_product(r_hat, r, local_N);
        MPI_Reduce(&t1, &rho, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
        //if(!rank)
        MPI_Bcast(&rho, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
        //rho = dot_product(r_hat, r, N);
        // if(isnan(rho)) {
        //     printf("NaN detected in rho at iteration %d on rank %d\n", iter, rank);
        //     exit(1);
        // }
        // if (rho_old == 0) {
        //     if(!rank) printf("Breakdown: rho = 0 at iteration %d on rank %d\n", iter, rank);
        //     exit(1);
        // }
        
        // 14. beta = (rho_i / rho_{i-1}) * (alpha / omega)
        beta = (rho / rho_old) * (alpha / omega);
        /*if(isnan(beta)) {
            printf("NaN detected in beta at iteration %d on rank %d\n", iter, rank);
            exit(1);
        }*/
        // 15. p_i = r_i + beta * (p_{i-1} - omega * v)
        bdd = _mm512_set1_pd(beta);
        #pragma omp parallel
        {
            #pragma omp for
            for (int i = 0; i < local_N; i += 8) {
                //p[i] = r[i] + beta * (p[i] - omega * v[i]);
                if(i + 8 > local_N) {
                    #pragma omp simd
                    for (int k = i; k < local_N; k++) {
                        p[k] = r[k] + beta * (p[k] - omega * v[k]);
                    }
                }
                else
                    _mm512_storeu_pd(p + i, _mm512_fmadd_pd(bdd, _mm512_sub_pd(_mm512_loadu_pd(p + i), _mm512_mul_pd(bdc, _mm512_loadu_pd(v + i))), _mm512_loadu_pd(r + i)));
                
            }
        }
        //printf("reach 4 %d\n", iter);
        
    }

    free(r);
    free(r_hat);
    free(p);
    free(v);
    free(s);
    free(h);
    free(t);
    free(y);
    free(z);
    free(K2_inv);
    free(counts_send);
    free(displacements);

    if (iter >= max_iter)
        return -1;
    else
        return iter;
}
