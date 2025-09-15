#include "buffer.h"
#include "tile.h"
#include "reshape.h"
#include <unistd.h>

#include <iostream>
#include <cstring>
#include <chrono>
#include <immintrin.h>

#define M 12
#define K 32
#define N 32

void naive_gemm(uint8_t* A, int8_t* B, uint32_t* C, int m, int n, int k) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            for (int kk = 0; kk < k * 4; kk++) {
                C[i * n + j] += A[i * k * 4 + kk] * B[j * k * 4 + kk];
            }
        }
    }
}

int main() {
    uint8_t* A = new uint8_t[M * K * 4];
    int8_t* B = new int8_t[N * K * 4];
    int8_t* B_reshape = new int8_t[N * K * 4];

    uint32_t* C = new uint32_t[M * N];
    uint32_t* C_ref = new uint32_t[M * N];

    init_buffer(A, M, K * 4);
    init_buffer(B, N, K * 4);

    // Naive Implementation (Baseline)
    std::chrono::high_resolution_clock::time_point start_time = std::chrono::high_resolution_clock::now();

    for (int iter = 0; iter < 100000; iter ++) {
        memset(C_ref, 0, sizeof(uint32_t) * M * N);
        naive_gemm(A, B, C_ref, M, N, K);
    }

    std::chrono::high_resolution_clock::time_point end_time = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration1 = end_time - start_time;
    std::cout << "Time: " << duration1.count() << " s" << std::endl;

    // Optimized
    // Write your code here
    // You can only modify the code between 'start' and 'end'

    start_time = std::chrono::high_resolution_clock::now();
    set_tiledata_use();

    // Initialize AMX tile
    // start
    
    // end

    for (int iter = 0; iter < 100000; iter ++) {
        memset(C, 0, sizeof(uint32_t) * M * N);
        // reshape B
        reshape((uint8_t*)B, N, K * 4, (uint8_t*)B_reshape);

        // !!!Choose a matrix multiplication from the following to achieve!!!
        // do AVX GEMM / AMX GEMM
        // start
        /*__m512i a0, a1, a2, a3, b0, b1, c0, c1;
        for(int i = 0; i < M; i += 2) {
            a0 = _mm512_loadu_si512(A + i * K * 4);
            a1 = _mm512_loadu_si512(A + i * K * 4 + K * 4 / 2);
            a2 = _mm512_loadu_si512(A + (i + 1) * K * 4);
            a3 = _mm512_loadu_si512(A + (i + 1) * K * 4 + K * 4 / 2);
            // Prefetch next rows
            _mm_prefetch(A + (i + 2) * K * 4, _MM_HINT_T0);
            _mm_prefetch(A + (i + 2) * K * 4 + K * 4 / 2, _MM_HINT_T0);
            _mm_prefetch(A + (i + 3) * K * 4, _MM_HINT_T0);
            _mm_prefetch(A + (i + 3) * K * 4 + K * 4 / 2, _MM_HINT_T0);
            for(int j = 0; j < N; j++) {
                b0 = _mm512_loadu_si512(B + j * K * 4);
                b1 = _mm512_loadu_si512(B + j * K * 4 + K * 4 / 2);
                _mm_prefetch(B + (j + 1) * K * 4, _MM_HINT_T0);
                _mm_prefetch(B + (j + 1) * K * 4 + K * 4 / 2, _MM_HINT_T0);
                c0 = _mm512_setzero_si512();
                c1 = _mm512_setzero_si512();
                c0 = _mm512_dpbusd_epi32(c0, a0, b0);
                c0 = _mm512_dpbusd_epi32(c0, a1, b1);
                c1 = _mm512_dpbusd_epi32(c1, a2, b0);
                c1 = _mm512_dpbusd_epi32(c1, a3, b1);
                C[i * N + j] += _mm512_reduce_add_epi32(c0);
                C[(i + 1) * N + j] += _mm512_reduce_add_epi32(c1);
            }
        }*/
        __m512i bodcstA1, bodcstA2, b0, b1, b2, b3, c0, c1;
        for(int j = 0; j < K; j += 2){
            b0 = _mm512_loadu_si512(B_reshape + j * N * 4);
            b1 = _mm512_loadu_si512(B_reshape + j * N * 4 + N * 4 / 2);
            b2 = _mm512_loadu_si512(B_reshape + (j + 1) * N * 4);
            b3 = _mm512_loadu_si512(B_reshape + (j + 1) * N * 4 + N * 4 / 2);
            // Prefetch next rows
            _mm_prefetch(B_reshape + (j + 2) * N * 4, _MM_HINT_T0);
            _mm_prefetch(B_reshape + (j + 2) * N * 4 + N * 4 / 2, _MM_HINT_T0);
            _mm_prefetch(B_reshape + (j + 3) * N * 4, _MM_HINT_T0);
            _mm_prefetch(B_reshape + (j + 3) * N * 4 + N * 4 / 2, _MM_HINT_T0);
            for(int i = 0; i < M; i ++) {
                bodcstA1 = _mm512_set1_epi32(*(int*)(A + i * K * 4 + j * 4));
                bodcstA2 = _mm512_set1_epi32(*(int*)(A + i * K * 4 + (j + 1) * 4));
                _mm_prefetch(C + (i + 2) * N, _MM_HINT_T0);
                _mm_prefetch(C + (i + 2) * N + N / 2, _MM_HINT_T0);
                c0 = _mm512_loadu_si512(C + i * N);
                c1 = _mm512_loadu_si512(C + i * N + N / 2);
                c0 = _mm512_dpbusd_epi32(c0, bodcstA1, b0);
                c0 = _mm512_dpbusd_epi32(c0, bodcstA2, b2);
                c1 = _mm512_dpbusd_epi32(c1, bodcstA1, b1);
                c1 = _mm512_dpbusd_epi32(c1, bodcstA2, b3);
                _mm512_storeu_epi32(C + i * N, c0);
                _mm512_storeu_epi32(C + i * N + N / 2, c1);
            }
        }
        // end
    }
    end_time = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration2 = end_time - start_time;
    std::cout << "Time: " << duration2.count() << " s" << std::endl;

    // Verify the answer
    check_result(C, C_ref, M, N);
    double speedup = duration1.count() / duration2.count();
    std::cout << "Speedup: " << speedup << std::endl;

    return 0;
}