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
    typedef struct __tile_config
    {
        // 64 bytes
        uint8_t palette_id;
        uint8_t start_row;
        uint8_t reserved_0[14];
        uint16_t colsb[16]; 
        uint8_t rows[16]; 
    } __tilecfg;
    __tilecfg config = {0};
    {
        config.palette_id = 1;
        config.start_row = 0;
    
        config.colsb[0] = 64;
        config.rows[0] = M;

        config.colsb[1] = 64;
        config.rows[1] = M;
    
        config.colsb[2] = 64;
        config.rows[2] = 16;

        config.colsb[3] = 64;
        config.rows[3] = 16;

        config.colsb[4] = 64;
        config.rows[4] = 16;

        config.colsb[5] = 64;
        config.rows[5] = 16;

        config.colsb[6] = 64;
        config.rows[6] = M;

        config.colsb[7] = 64;
        config.rows[7] = M;
    }
    _tile_loadconfig(&config);
    // end

    for (int iter = 0; iter < 100000; iter ++) {
        memset(C, 0, sizeof(uint32_t) * M * N);
        // reshape B
        reshape((uint8_t*)B, N, K * 4, (uint8_t*)B_reshape);

        // !!!Choose a matrix multiplication from the following to achieve!!!
        // do AVX GEMM / AMX GEMM
        // start
        _tile_loadd(0, A, K * 4);
        _tile_loadd(1, A + 64, K * 4);
        _tile_loadd(2, B_reshape, N * 4);
        _tile_loadd(3, B_reshape + N * 4 / 2, N * 4);
        _tile_loadd(4, B_reshape + K / 2 * N * 4, N * 4);
        _tile_loadd(5, B_reshape + K / 2 * N * 4 + N * 4 / 2, N * 4);
        _tile_zero(6);
        _tile_zero(7);
        _tile_dpbusd(6, 0, 2);
        _tile_dpbusd(7, 0, 3);
        _tile_dpbusd(6, 1, 4);
        _tile_dpbusd(7, 1, 5);
        _tile_stored(6, C, N * 4);
        _tile_stored(7, C + N / 2, N * 4);
        /*if(C[11*N]==C_ref[11*N]) {
            std::cout << "Correct partly!" << std::endl;
        }*/
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