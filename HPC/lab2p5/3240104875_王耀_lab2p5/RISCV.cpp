#include "gemm.h"
//#include<stdio.h>
//#include <pthread.h>


#include <riscv_vector.h>

void optimized_gemm(uint8_t* A, int8_t* B, int32_t* C, int m, int n, int k) {
    // Start your RVV journey here!

    vuint8m4_t a1, a2, a3, a4;
    vint8m4_t b;
    vint16m8_t c;
    vint32m1_t ct = __riscv_vmv_v_x_i32m1(0, 1);
    size_t vl = k * 4;
    //#pragma omp parallel for collapse(2)
    for(int i = 0; i < m; i += 4) {
        vl = __riscv_vsetvl_e8m4(k * 4);
        a1 = __riscv_vle8_v_u8m4(A + i * k * 4, vl);
        a2 = __riscv_vle8_v_u8m4(A + (i + 1) * k * 4, vl);
        a3 = __riscv_vle8_v_u8m4(A + (i + 2) * k * 4, vl);
        a4 = __riscv_vle8_v_u8m4(A + (i + 3) * k * 4, vl);
        __builtin_prefetch(A + (i + 4) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 5) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 6) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 7) * k * 4, 0, 3);
        for (int j = 0; j < n; j++) {
            vl = __riscv_vsetvl_e8m4(k * 4);
            b = __riscv_vle8_v_i8m4(B + j * k * 4, vl);
            __builtin_prefetch(B + (j + 1) * k * 4, 0, 3);
            c = __riscv_vwmulsu_vv_i16m8(b, a1, vl);
            C[i * n + j] = __riscv_vmv_x_s_i32m1_i32(__riscv_vwredsum_vs_i16m8_i32m1(c, ct, vl));
            c = __riscv_vwmulsu_vv_i16m8(b, a2, vl);
            C[(i + 1) * n + j] = __riscv_vmv_x_s_i32m1_i32(__riscv_vwredsum_vs_i16m8_i32m1(c, ct, vl));
            c = __riscv_vwmulsu_vv_i16m8(b, a3, vl);
            C[(i + 2) * n + j] = __riscv_vmv_x_s_i32m1_i32(__riscv_vwredsum_vs_i16m8_i32m1(c, ct, vl));
            c = __riscv_vwmulsu_vv_i16m8(b, a4, vl);
            C[(i + 3) * n + j] = __riscv_vmv_x_s_i32m1_i32(__riscv_vwredsum_vs_i16m8_i32m1(c, ct, vl));
        }
    }
    /*for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            for (int kk = 0; kk < k * 4; kk++) {
                C[i * n + j] += A[i * k * 4 + kk] * B[j * k * 4 + kk];
            }
        }
    }*/
}
