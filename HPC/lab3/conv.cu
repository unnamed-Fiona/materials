#include "conv.cuh"
#include <cuda/barrier>
#include <mma.h>
#include <cooperative_groups.h>
#include <cooperative_groups/memcpy_async.h>

namespace cg = cooperative_groups;


#define a(_n, _x, _y, _c) a[(_n) * H * W * C + (_x) * W * C + (_y) * C + (_c)]
#define w(_k, _x, _y, _c) w[(_k) * R * S * C + (_x) * S * C + (_y) * C + (_c)]
#define b(_n, _x, _y, _k) b[(_n) * H * W * K + (_x) * W * K + (_y) * K + (_k)]
#define LENGTH (C)
#define FLEN (16)
#define KLEN (16)
#define IML (128)
#define STRIDE (FLEN+8)
#define a_shared(_x, _y, _c) a_shared[(_x) * (BLOCK + S / 2 * 2) * (LENGTH+4) + (_y) * (LENGTH+4) + (_c)]
#define w_shared(_x, _y, _c) w_shared[(_x) * S * (LENGTH+4) + (_y) * (LENGTH+4) + (_c)]
// #define a_buf(_x, _y, _c) a_buf[(_x) * (BLOCK + S / 2 * 2) * (LENGTH+4) + (_y) * (LENGTH+4) + (_c)]
// #define w_buf(_x, _y, _c) w_buf[(_x) * S * (LENGTH+4) + (_y) * (LENGTH+4) + (_c)]
#define a_buf(_x, _y) a_buf[(_x)*(STRIDE)+(_y)]
#define w_buf(_x, _y) w_buf[(_x)*(STRIDE)+(_y)]
using namespace nvcuda;




static constexpr int BLOCK = 16;
__device__ int zero[LENGTH] = {0};
__device__ __half zerof[FLEN];
__device__ int8_t off[3]={-1,0,1};

// INT8
template <>
KernelConfig get_kernel_config<int8_t>() {
    KernelConfig config;
    config.grid = dim3((H + BLOCK - 1) / BLOCK, (W + BLOCK - 1) / BLOCK);
    config.block = dim3(BLOCK, BLOCK);
    config.shared_memory_size = 0;  // Use default shared memory size
    return config;
}
/*
template<typename T>
__device__ __forceinline__
void fetch(const T* __restrict__ a, 
            T* __restrict__ a_shared, 
            const T* __restrict__ w, 
            T* __restrict__ w_shared,
            int n, int c, int k, int i, int j, 
            cuda::barrier<cuda::thread_scope_block> &bar) {
    if (i < size && j < size) {
        cuda::memcpy_async(&a_shared(threadIdx.x+1, threadIdx.y+1, 0), &a(n, i, j, c), LENGTH*sizeof(T), bar);
    }
    else {
        cuda::memcpy_async(&a_shared(threadIdx.x+1, threadIdx.y+1, 0), zero, LENGTH*sizeof(T), bar);
    }
    if(threadIdx.x < R + 3 && threadIdx.y < S + 3 && threadIdx.x >= 3 && threadIdx.y >= 3) {
        cuda::memcpy_async(&w_shared(threadIdx.x - 3, threadIdx.y - 3, 0), &w(k, threadIdx.x - 3, threadIdx.y - 3, c), LENGTH*sizeof(T), bar);
    }
    switch(threadIdx.x){
        case 0:
            if(i - 1 >= 0 && j >= 0 && j < W) cuda::memcpy_async(&a_shared(0, threadIdx.y + 1, 0), &a(n, i - 1, j, c), LENGTH*sizeof(T), bar);
            else cuda::memcpy_async(&a_shared(0, threadIdx.y + 1, 0), zero, LENGTH*sizeof(T), bar);
            break;
        case 15:
            if(i + 1 < H && j >= 0 && j < W) cuda::memcpy_async(&a_shared(BLOCK + 1, threadIdx.y + 1, 0), &a(n, i + 1, j, c), LENGTH*sizeof(T), bar);
            else cuda::memcpy_async(&a_shared(BLOCK + 1, threadIdx.y + 1, 0), zero, LENGTH*sizeof(T), bar);
            break;
    }
    switch(threadIdx.y){
        case 0:
            if(j - 1 >= 0 && i >= 0 && i < H) cuda::memcpy_async(&a_shared(threadIdx.x + 1, 0, 0), &a(n, i, j - 1, c), LENGTH*sizeof(T), bar);
            else cuda::memcpy_async(&a_shared(threadIdx.x + 1, 0, 0), zero, LENGTH*sizeof(T), bar);
            break;
        case 15:
            if(j + 1 < W && i >= 0 && i < H) cuda::memcpy_async(&a_shared(threadIdx.x + 1, BLOCK + 1, 0), &a(n, i, j + 1, c), LENGTH*sizeof(T), bar);
            else cuda::memcpy_async(&a_shared(threadIdx.x + 1, BLOCK + 1, 0), zero, LENGTH*sizeof(T), bar);
            break;
    }
    if(threadIdx.x < 12 && threadIdx.y < 12 && threadIdx.x >= 10 && threadIdx.y >= 10) {
        if(i + (BLOCK+1) * (static_cast<int>(threadIdx.x) - 10) >= threadIdx.x + 1 && 
                i + (BLOCK+1) * (static_cast<int>(threadIdx.x) - 10) < H + threadIdx.x + 1 &&
                j + (BLOCK+1) * (static_cast<int>(threadIdx.y) - 10) >= threadIdx.y + 1 &&
                j + (BLOCK+1) * (static_cast<int>(threadIdx.y) - 10) < W + threadIdx.y + 1) 
            cuda::memcpy_async(&a_shared((threadIdx.x - 10) * (BLOCK + 1), (threadIdx.y - 10) * (BLOCK + 1), 0), 
                               &a(n, i - threadIdx.x - 1 + (BLOCK + 1) * (threadIdx.x - 10), 
                                   j - threadIdx.y - 1 + (BLOCK + 1) * (threadIdx.y - 10), c), LENGTH*sizeof(T), bar);
        else cuda::memcpy_async(&a_shared((threadIdx.x - 10) * (BLOCK + 1), (threadIdx.y - 10) * (BLOCK + 1), 0), zero, LENGTH*sizeof(T), bar);
    }
}
*/
/*
template<typename T>
__device__ __forceinline__
void cpy(T* __restrict__ dst, 
         const T* __restrict__ src, 
         int len) {
    #pragma unroll
    for(int i = 0; i < len; ++i) {
        dst[i] =  __ldg(src + i);
    }
}

template<typename T>
__device__ __forceinline__
void fetch(const T* __restrict__ a, 
            T* __restrict__ a_shared, 
            const T* __restrict__ w, 
            T* __restrict__ w_shared,
            int n, int c, int k, int i, int j) {
    if (i < size && j < size) {
        cpy(&a_shared(threadIdx.x+1, threadIdx.y+1, 0), &a(n, i, j, c), LENGTH);
    }
    else {
        cpy(&a_shared(threadIdx.x+1, threadIdx.y+1, 0), zero, LENGTH);
    }
    if(threadIdx.x < R + 3 && threadIdx.y < S + 3 && threadIdx.x >= 3 && threadIdx.y >= 3) {
        cpy(&w_shared(threadIdx.x - 3, threadIdx.y - 3, 0), &w(k, threadIdx.x - 3, threadIdx.y - 3, c), LENGTH);
    }
    switch(threadIdx.x){
        case 0:
            if(i - 1 >= 0 && j >= 0 && j < W) cpy(&a_shared(0, threadIdx.y + 1, 0), &a(n, i - 1, j, c), LENGTH);
            else cpy(&a_shared(0, threadIdx.y + 1, 0), zero, LENGTH);
            break;
        case 15:
            if(i + 1 < H && j >= 0 && j < W) cpy(&a_shared(BLOCK + 1, threadIdx.y + 1, 0), &a(n, i + 1, j, c), LENGTH);
            else cpy(&a_shared(BLOCK + 1, threadIdx.y + 1, 0), zero, LENGTH);
            break;
    }
    switch(threadIdx.y){
        case 0:
            if(j - 1 >= 0 && i >= 0 && i < H) cpy(&a_shared(threadIdx.x + 1, 0, 0), &a(n, i, j - 1, c), LENGTH);
            else cpy(&a_shared(threadIdx.x + 1, 0, 0), zero, LENGTH);
            break;
        case 15:
            if(j + 1 < W && i >= 0 && i < H) cpy(&a_shared(threadIdx.x + 1, BLOCK + 1, 0), &a(n, i, j + 1, c), LENGTH);
            else cpy(&a_shared(threadIdx.x + 1, BLOCK + 1, 0), zero, LENGTH);
            break;
    }
    if(threadIdx.x < 12 && threadIdx.y < 12 && threadIdx.x >= 10 && threadIdx.y >= 10) {
        if(i + (BLOCK+1) * (static_cast<int>(threadIdx.x) - 10) >= threadIdx.x + 1 && 
                i + (BLOCK+1) * (static_cast<int>(threadIdx.x) - 10) < H + threadIdx.x + 1 &&
                j + (BLOCK+1) * (static_cast<int>(threadIdx.y) - 10) >= threadIdx.y + 1 &&
                j + (BLOCK+1) * (static_cast<int>(threadIdx.y) - 10) < W + threadIdx.y + 1) 
            cpy(&a_shared((threadIdx.x - 10) * (BLOCK + 1), (threadIdx.y - 10) * (BLOCK + 1), 0), 
                &a(n, i - threadIdx.x - 1 + (BLOCK + 1) * (threadIdx.x - 10), 
                    j - threadIdx.y - 1 + (BLOCK + 1) * (threadIdx.y - 10), c), LENGTH);
        else cpy(&a_shared((threadIdx.x - 10) * (BLOCK + 1), (threadIdx.y - 10) * (BLOCK + 1), 0), zero, LENGTH);
    }
}
*/

template<typename T>
__device__ __forceinline__
void fetch(const T* __restrict__ a, 
            T* __restrict__ a_shared, 
            int n) {
    int idx = threadIdx.y / 2 * 2, wpid = (threadIdx.y*blockDim.x+threadIdx.x)%32;
    int i = blockIdx.x * blockDim.x, j = blockIdx.y * blockDim.y;
    switch(idx){
        case 0:
            for(int y = 0; y < 3; y++){
                for(int x = 0; x < BLOCK+2; x++){
                    if(i+x-1<H&&i+x-1>=0&&idx+j+y-1<W&&idx+j+y-1>=0) 
                        *(int*)&a_shared(x, idx+y, wpid*4) = *(int*)&a(n, i + x - 1, idx + j + y - 1, wpid*4);
                    else 
                        *(int*)&a_shared(x, idx+y, wpid*4) = zero[wpid];
                }
            }
            break;
        case 14:
            for(int y = 0; y < 3; y++){
                for(int x = 0; x < BLOCK+2; x++){
                    if(i+x-1<H&&i+x-1>=0&&idx+j+y<W&&idx+j+y>=0) 
                        *(int*)&a_shared(x, idx+y+1, wpid*4) = *(int*)&a(n, i + x - 1, idx + j + y, wpid*4);
                    else 
                        *(int*)&a_shared(x, idx+y+1, wpid*4) = zero[wpid];
                }
            }
            break;
        default:
            for(int y = 0; y < 2; y++){
                for(int x = 0; x < BLOCK+2; x++){
                    if(i+x-1<H&&i+x-1>=0&&idx+j+y<W&&idx+j+y>=0) 
                        *(int*)&a_shared(x, idx+y+1, wpid*4) = *(int*)&a(n, i + x - 1, idx + j + y, wpid*4);
                    else    
                        *(int*)&a_shared(x, idx+y+1, wpid*4) = zero[wpid];
                }

            }
            //*(int*)&w_shared(x/R, x%R, coeff*32+wpid*4) = *(int*)&w(k, x/R, x%R, c + wpid*4);
            break;
    }
}

template<typename T>
__device__ __forceinline__
void fetchfil(const T* __restrict__ w, 
            T* __restrict__ w_shared,
            int k){
    int idx = threadIdx.y / 2, wpid = (threadIdx.y*blockDim.x+threadIdx.x)%32;
    switch(idx){
        case 0:
            *(int*)&w_shared(0, idx, wpid*4) = *(int*)&w(k,0, idx, wpid*4);
            *(int*)&w_shared(0, 8, wpid*4) = *(int*)&w(k, 0, 8, wpid*4);
            break;
        default:
            *(int*)&w_shared(0, idx, wpid*4) = *(int*)&w(k, 0, idx, wpid*4);
            break;
    }
}

template <>
__global__ void conv2d_cuda_kernel<int8_t, int>(const int8_t *__restrict__ a, const int8_t *__restrict__ w,
                                                int8_t *__restrict__ b) {
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    const int j = blockIdx.y * blockDim.y + threadIdx.y;
    alignas(LENGTH) __shared__ int8_t a_shared[(BLOCK + R / 2 * 2) * (BLOCK + S / 2 * 2) * (LENGTH+4)]/*, 
                        a_next[(BLOCK + R / 2 * 2) * (BLOCK + S / 2 * 2) * (LENGTH+4)]*/;
    alignas(LENGTH) __shared__ int8_t w_shared[R * S * (LENGTH+4)]/*, w_next[R*S*(LENGTH+4)]*/;
    // __shared__ cuda::barrier<cuda::thread_scope_block> bar;
    // int8_t* __restrict__ a_buf=a_shared, *w_buf=w_shared, *aa=a_next, *ww= w_next, *t=NULL;
    // if (threadIdx.x == 0 && threadIdx.y == 0) {
    //     init(&bar, blockDim.x * blockDim.y);
    // }
    // __syncthreads();
    // fetch<int8_t>(a, a_buf, w, w_buf,0, 0, 0, i, j, bar);
    // bar.arrive_and_wait();
    //if (i < size && j < size) {
//     cudaSharedMemConfig config;
// cudaDeviceGetSharedMemConfig(&config);
// if (config == cudaSharedMemBankSizeFourByte) {
//   printf("Bank width = 4 bytes\n");
// } else if (config == cudaSharedMemBankSizeEightByte) {
//   printf("Bank width = 8 bytes\n");
// } else {
//   printf("Unknown shared mem config\n");
// }

    for (int n = 0; n < N; ++n) {
        fetch<int8_t>(a, a_shared, n);
        for (int k = 0; k < K; ++k) {
            int result = 0;
                /*int x = i - R / 2, y = j - S / 2;
                for (int r = 0; r < R; ++r) {
                    for (int s = 0; s < S; ++s) {
                        if (!(x < 0 || x >= size || y < 0 || y >= size)) {
                            result += static_cast<int>(a(n, x, y, c)) * static_cast<int>(w(k, r, s, c));
                        }
                        y++;
                    }
                    x++;
                    y -= S;
                }*/
            // switch(c){
            //     case C - LENGTH:
            //         switch(k){
            //             case K-1:
            //                 if(n!=N-1) fetch<int8_t>(a, aa, w, ww, n+1, 0, 0, i, j, bar);
            //                 break;
            //             default:
            //                 fetch<int8_t>(a, aa, w, ww, n, 0, k+1, i, j, bar);
            //                 break;
            //         }
            //         break;
            //     default:
            //         fetch<int8_t>(a, aa, w, ww, n, c+LENGTH, k, i, j, bar);
            //         break;
            // }

            //if((a_buf(threadIdx.x+1,threadIdx.y+1, c)!=a(n,i,j,c)&&a_buf(threadIdx.x+1,threadIdx.y+1,c))) printf("Error at %d %d\n",i,j);
            // #pragma unroll
            // for(int x = 0; x < LENGTH/32; x++){
            fetchfil<int8_t>(w, w_shared,k);
            __syncthreads();
            if (i < size && j < size){
                for(int ct = 0; ct < LENGTH; ct += 4){
                    int x = threadIdx.x, y = threadIdx.y;
                    // if(x+1<BLOCK+2&&y+1<BLOCK+2&&a_shared(x+1,y+1,ct)!=a(n,i,j,ct)) printf("Error at %d %d %d, %d %d\n",i,j,ct,a_shared(x+1,y+1,ct), a(n,i,j,ct));
                    // else if(x+1>=BLOCK+2||y+1>=BLOCK+2) printf("Illegal at %d %d %d\n",x,y,BLOCK+2);
                    for (int r = 0; r < R; ++r) {
                        for (int s = 0; s < S; ++s) {
                            if (!(x < 0 || x >= BLOCK + R / 2 * 2 || y < 0 || y >= BLOCK + S / 2 * 2)) {
                                //result += static_cast<int>(a_buf(x, y, ct)) * static_cast<int>(w_buf(r, s, ct));
                                // result = __dp4a(*((int*)&a_buf(x, y, ct)), *((int*)&w_buf(r, s, ct)), result);
                                result = __dp4a(*((int*)&a_shared(x, y, ct)), *((int*)&w_shared(r, s, ct)), result);
                            }
                            y++;
                        }
                        x++;
                        y -= S;
                    }
                }
                
            }
            // bar.arrive_and_wait();
            
            // t= a_buf;
            // a_buf = aa;
            // aa = t;
            // t = w_buf;
            // w_buf = ww;
            // ww = t;
            __syncthreads();
        
            // if(&b(n,i,j,k)-b==1228800) printf("Error at %d %d,value is %d\n",i,j,static_cast<int8_t>(result));
            if(i<size&&j<size) b(n, i, j, k) = static_cast<int8_t>(result);
        }
    }
    //}
    /*else{
        for (int n = 0; n < N; ++n) {
            for (int c = 0; c < C; ++c) {
                a_shared(threadIdx.x+1, threadIdx.y+1) = 0;
            }
        }
    }*/
}

// HALF
template <>
KernelConfig get_kernel_config<half_t>() {
    KernelConfig config;
    config.grid = dim3((H + BLOCK - 1) / BLOCK, (W + BLOCK - 1) / BLOCK);
    config.block = dim3(BLOCK, BLOCK);
    config.shared_memory_size = 0;  // Use default shared memory size
    return config;
}

__device__ __forceinline__
void tile(const half_t* __restrict__ a, 
    __half* __restrict__ a_buf, 
    int n, int c, int ii, int im,
    cuda::barrier<cuda::thread_scope_block> &bar)
{
    int widx = threadIdx.y / 2;
    int i = blockIdx.x * blockDim.x+widx/(BLOCK/(IML/8))+im, j = blockIdx.y * blockDim.y+widx%(BLOCK/(IML/8))*IML/8;
    // int i = blockIdx.x * blockDim.x + widx/(BLOCK/(IML/8)), j = blockIdx.y * blockDim.y;
    for(int x=0;x<IML/8;x++){
        if(i+off[ii/3]>=0&&i+off[ii/3]<H&&j+x+off[ii%3]>=0&&j+x+off[ii%3]<W)
            cuda::memcpy_async(&a_buf(widx*IML/8+x,0), &a(n,i+off[ii/3],j+x+off[ii%3],c), FLEN*sizeof(__half), bar);
        else cuda::memcpy_async(&a_buf(widx*IML/8+x,0), zerof, FLEN*sizeof(__half), bar);
    }
}

__device__ __forceinline__
void filter(const half_t* __restrict__ w,
    __half* __restrict__ w_buf,
    int k, int c, int ii,
    cuda::barrier<cuda::thread_scope_block> &bar)
{
    int widx = threadIdx.y / 2;
    for(int x=0;x<KLEN/8;x++){
        cuda::memcpy_async(&w_buf(widx*KLEN/8+x,0),&w(k+widx*KLEN/8+x,0,ii,c),FLEN*sizeof(__half),bar);
    }
}

__device__ __forceinline__
void tile_cg(
    const half_t* __restrict__ a,
    __half* __restrict__ a_buf,
    int n, int c, int ii, int im,
    cg::thread_block_tile<32> &cg_block)
{
    int widx = threadIdx.y / 2;
    int i = blockIdx.x * blockDim.x+widx/(BLOCK/(IML/8))+im, j = blockIdx.y * blockDim.y+widx%(BLOCK/(IML/8))*IML/8;
    // int i = blockIdx.x * blockDim.x + widx/(BLOCK/(IML/8)), j = blockIdx.y * blockDim.y;
    __half* src=NULL;
    // if(widx!=cg_block.meta_group_rank()) printf("Error\n");
    // printf("warp %d lane %d => i=%d j=%d\n",
    //    wgrp.meta_group_rank(),
    //    wgrp.thread_rank(),
    //    i, j);

    for(int x=0;x<IML/8;x++){
        if(i+off[ii/3]>=0&&i+off[ii/3]<H&&j+x+off[ii%3]>=0&&j+x+off[ii%3]<W){
            src=(__half*)&a(n,i+off[ii/3],j+x+off[ii%3],c);
            // printf("Src at a");
        }
        else src=zerof;
        cg::memcpy_async(cg_block,&a_buf(widx*IML/8+x,0), src, FLEN);
        cg::wait(cg_block);
    }
}

// filter: load filter weights into shared buffer using cooperative memcpy_async
__device__ __forceinline__
void filter_cg(
    const half_t* __restrict__ w,
    __half* __restrict__ w_buf,
    int k, int c, int ii,
    cg::thread_block_tile<32> &cg_block)
{
    int widx = threadIdx.y / 2;
    for (int x = 0; x < KLEN/8; x++) {
        cg::memcpy_async(
            cg_block,
            &w_buf(widx * (KLEN/8) + x, 0),
            (__half*)&w(k + widx * (KLEN/8) + x, 0, ii, c),
            FLEN
        );
        cg::wait(cg_block);
    }
}


template <>
__global__ void conv2d_cuda_kernel<half_t, float>(const half_t *__restrict__ a, const half_t *__restrict__ w,
                                                  half_t *__restrict__ b) {
    const int i = blockIdx.x * blockDim.x;
    const int j = blockIdx.y * blockDim.y;
    const int widx = threadIdx.y / 2;
    alignas(16) __shared__ __half tmp[8][16*16];
    alignas(128) __shared__ __half a1[IML*(STRIDE)],a2[IML*(STRIDE)],w1[KLEN*(STRIDE)],w2[KLEN*(STRIDE)];
    __shared__ cuda::barrier<cuda::thread_scope_block> bar;
    cg::thread_block tb = cg::this_thread_block();
    cg::thread_block_tile<32> wgrp = cg::tiled_partition<32>(tb);
    __half *a_buf=a1, *aa=a2, *w_buf=w1, *ww=w2,*t;
    wmma::fragment<wmma::matrix_a, 16, 16, 16, half, wmma::row_major> a_frag;
    wmma::fragment<wmma::matrix_b, 16, 16, 16, half, wmma::col_major> b_frag;
    wmma::fragment<wmma::accumulator, 16, 16, 16, half> c_frag;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        init(&bar, blockDim.x * blockDim.y);
    }
    __syncthreads();
    tile(a,a_buf,0,0,0,0,bar);
    filter(w,w_buf,0,0,0,bar);
    // tile_cg(a,a_buf,0,0,0,0,wgrp);
    // filter_cg(w,w_buf,0,0,0,wgrp);
    zerof[threadIdx.x]= __float2half(0.0f);
    // cg::wait(wgrp);
    
    bar.arrive_and_wait();
    for(int n = 0; n < N; n++){
        for(int im = 0; im < BLOCK; im += IML/BLOCK){
            for(int k = 0 ;k < K; k += KLEN){
                wmma::fill_fragment(c_frag, 0.0f);
                
                for(int c = 0; c < C; c += FLEN){
                    for(int ii=0; ii < 9; ii++){
                        // printf("%d %d %d %d %d\n",n,im,k,c,ii);
                        switch(ii){
                            case 8:
                                switch(c){
                                    case C-FLEN:
                                        if(k!=K-KLEN) {
                                            filter(w,ww,k+KLEN,0,0,bar);
                                            tile(a,aa,n,0,0,im,bar);
                                        }
                                        else{
                                            if(im!=BLOCK-IML/BLOCK){
                                                tile(a,aa,n,0,0,im+IML/BLOCK,bar);
                                                filter(w,ww,0,0,0,bar);
                                            }
                                            else{
                                                if(n!=N-1){
                                                    tile(a,aa,n+1,0,0,0,bar);
                                                    filter(w,ww,0,0,0,bar);
                                                }
                                            }
                                        }
                                        break;
                                    default:
                                        tile(a,aa,n,c+FLEN,0,im,bar);
                                        filter(w,ww,k,c+FLEN,0,bar);
                                        break;
                                }
                                break;
                            default:
                                tile(a,aa,n,c,ii+1,im,bar);
                                
                                filter(w,ww,k,c,ii+1,bar);
                                
                                break;
                        }
                        // switch(ii){
                        //     case 8:
                        //         switch(c){
                        //             case C-FLEN:
                        //                 if(k!=K-KLEN) {
                        //                     filter_cg(w,ww,k+KLEN,0,0,wgrp);
                        //                     tile_cg(a,aa,n,0,0,im,wgrp);
                        //                 }
                        //                 else{
                        //                     if(im!=BLOCK-IML/BLOCK){
                        //                         tile_cg(a,aa,n,0,0,im+IML/BLOCK,wgrp);
                        //                         filter_cg(w,ww,0,0,0,wgrp);
                        //                     }
                        //                     else{
                        //                         if(n!=N-1){
                        //                             tile_cg(a,aa,n+1,0,0,0,wgrp);
                        //                             filter_cg(w,ww,0,0,0,wgrp);
                        //                         }
                        //                     }
                        //                 }
                        //                 break;
                        //             default:
                        //                 tile_cg(a,aa,n,c+FLEN,0,im,wgrp);
                        //                 filter_cg(w,ww,k,c+FLEN,0,wgrp);
                        //                 break;
                        //         }
                        //         break;
                        //     default:
                        //         tile_cg(a,aa,n,c,ii+1,im,wgrp);
                                
                        //         filter_cg(w,ww,k,c,ii+1,wgrp);
                                
                        //         break;
                        // }
                        
                        // if(i+im+off[ii/3]>=0&&i+im+off[ii/3]<H&&
                        //     j+0+off[ii%3]>=0&&j+0+off[ii%3]<W&&
                        //     a_buf(0,0)!=(__half)a(n,i+im+off[ii/3],j+0+off[ii%3],c)){
                        //     printf("Error at %d %d %d %d %d %d, %f!=%f\n",i,j,n,im,c,ii,float(a_buf(0,0)),float(a(n,i+im+off[ii/3],j+0+off[ii%3],c)));
                        // }
                        // printf("Once down\n");
                        // int id= threadIdx.y*blockDim.x+threadIdx.x;
                        // if(!ii&&!n&&!im&&!c&&i+im+id%128/16+off[ii/3]>=0&&i+im+id%128/16+off[ii/3]<H&&
                        //     j+id%128%16+off[ii%3]>=0&&j+id%128%16+off[ii%3]<W&&
                        //     a_buf(id%128,0)!=(__half)a(n,i+im+id%128/16+off[ii/3],j+id%128%16+off[ii%3],c))
                        //         printf("Error at %d %d %d %d %d %d %d, %f!=%f\n",i,j,n,im,c,ii,id%128,float(a_buf(id%128,0)),float(a(n,i+im+id%128/16+off[ii/3],j+id%128%16+off[ii%3],c)));
                        // if(w_buf(threadIdx.x%16,threadIdx.y%16)!=(__half)w(k+threadIdx.x%16,ii/3,ii%3,c+threadIdx.y%16))
                        //     printf("Error at %d %d %d %d %d %d %d, %f!=%f\n",i,j,n,im,c,ii,k,float(w_buf(threadIdx.x%16,threadIdx.y%16)),float(w(k+threadIdx.x%16,ii/3,ii%4,c+threadIdx.y%16)));
                        for(int ct=0;ct<FLEN;ct+=16){
                            wmma::load_matrix_sync(a_frag,&a_buf(widx*16,ct),STRIDE);
                            // printf("Once down\n");
                            wmma::load_matrix_sync(b_frag,&w_buf(0,ct),STRIDE);
                            wmma::mma_sync(c_frag,a_frag,b_frag,c_frag);
                        }
                        
                        // cg::wait(wgrp);
                        bar.arrive_and_wait();
                        // printf("Once down\n");
                        
                        t = a_buf;
                        a_buf = aa; 
                        aa = t;
                        t = w_buf;
                        w_buf = ww;
                        ww = t;
                    }
                }
                if(i+im+widx<H) {
                    if(j+KLEN<W) wmma::store_matrix_sync((__half*)&b(n,i+im+widx,j,k),c_frag,K,wmma::mem_row_major);
                    else{
                        wmma::store_matrix_sync(tmp[widx],c_frag,16,wmma::mem_row_major);
                        cuda::memcpy_async((__half*)&b(n,i+im+widx,j,k),&tmp[widx][0],sizeof(__half)*KLEN,bar);
                        cuda::memcpy_async((__half*)&b(n,i+im+widx,j+1,k),&tmp[widx][1*16],sizeof(__half)*KLEN,bar);
                        cuda::memcpy_async((__half*)&b(n,i+im+widx,j+2,k),&tmp[widx][2*16],sizeof(__half)*KLEN,bar);
                        cuda::memcpy_async((__half*)&b(n,i+im+widx,j+3,k),&tmp[widx][3*16],sizeof(__half)*KLEN,bar);
                    }
                }
                
            }
        }
    }
    // bar.arrive_and_wait();
}