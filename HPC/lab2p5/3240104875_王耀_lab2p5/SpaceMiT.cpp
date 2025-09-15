#include "gemm.h"
//#include<stdio.h>
//#include <pthread.h>


#include <riscv_vector.h>
/*
void optimized_gemm(uint8_t* A, int8_t* B, int32_t* C, int m, int n, int k) {
    // Start your RVV journey here!

    vuint8m4_t a1, a2, a3, a4;
    vint8m4_t b;
    vint16m8_t c;
    vint32m1_t ct = __riscv_vmv_v_x_i32m1(0, 1);
    size_t vl = k * 4;
    //#pragma omp parallel for collapse(2)
    for(int i = 0; i < m; i += 4) {
        a1 = __riscv_vle8_v_u8m4(A + i * k * 4, vl);
        a2 = __riscv_vle8_v_u8m4(A + (i + 1) * k * 4, vl);
        a3 = __riscv_vle8_v_u8m4(A + (i + 2) * k * 4, vl);
        a4 = __riscv_vle8_v_u8m4(A + (i + 3) * k * 4, vl);
        __builtin_prefetch(A + (i + 4) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 5) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 6) * k * 4, 0, 3);
        __builtin_prefetch(A + (i + 7) * k * 4, 0, 3);
        for (int j = 0; j < n; j++) {
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
}*/
/*
vint8m1_t loadi(int8_t* addr, int stride){
    vint8m1_t r1 = __riscv_vle8_v_i8m1(addr, 8);
    vint8m1_t r2 = __riscv_vle8_v_i8m1(addr + stride, 8);
    vint8m1_t r3 = __riscv_vle8_v_i8m1(addr + 2 * stride, 8);
    vint8m1_t r4 = __riscv_vle8_v_i8m1(addr + 3 * stride, 8);
    r1 = __riscv_vslideup_vx_i8m1(r1, r2, 8, 8 * 2);
    r1 = __riscv_vslideup_vx_i8m1(r1, r3, 8 * 2, 8 * 3);
    r1 = __riscv_vslideup_vx_i8m1(r1, r4, 8 * 3, 8 * 4);
    return r1;
}

vuint8m1_t loadu(uint8_t* addr, int stride){
    vuint8m1_t r1 = __riscv_vle8_v_u8m1(addr, 8);
    vuint8m1_t r2 = __riscv_vle8_v_u8m1(addr + stride, 8);
    vuint8m1_t r3 = __riscv_vle8_v_u8m1(addr + 2 * stride, 8);
    vuint8m1_t r4 = __riscv_vle8_v_u8m1(addr + 3 * stride, 8);
    r1 = __riscv_vslideup_vx_u8m1(r1, r2, 8, 8 * 2);
    r1 = __riscv_vslideup_vx_u8m1(r1, r3, 8 * 2, 8 * 3);
    r1 = __riscv_vslideup_vx_u8m1(r1, r4, 8 * 3, 8 * 4);
    return r1;
}
*/
void storei(int32_t* addr, vint32m2_t v, int stride){
    __riscv_vse32_v_i32m2(addr, v, 4);
    __riscv_vse32_v_i32m2(addr + stride, __riscv_vslidedown_vx_i32m2(v, 4, 4), 4);
    __riscv_vse32_v_i32m2(addr + 2 * stride, __riscv_vslidedown_vx_i32m2(v, 4 * 2, 4), 4);
    __riscv_vse32_v_i32m2(addr + 3 * stride, __riscv_vslidedown_vx_i32m2(v, 4 * 3, 4), 4);
}
/*
vint32m2_t load32(int32_t* addr, int stride) {
    vint32m2_t r1 = __riscv_vle32_v_i32m2(addr, 4);
    vint32m2_t r2 = __riscv_vle32_v_i32m2(addr + stride, 4);
    vint32m2_t r3 = __riscv_vle32_v_i32m2(addr + 2 * stride, 4);
    vint32m2_t r4 = __riscv_vle32_v_i32m2(addr + 3 * stride, 4);
    r1 = __riscv_vslideup_vx_i32m2(r1, r2, 4, 8);
    r1 = __riscv_vslideup_vx_i32m2(r1, r3, 8, 12);
    r1 = __riscv_vslideup_vx_i32m2(r1, r4, 12, 16);
    return r1;
}
*/
vint32m2_t vmdt(vint32m2_t c, vuint8m1_t a, vint8m1_t b) {
    asm volatile(
        "vmadotus %0, %1, %2"
        : "+vr"(c)
        : "vr"(a), "vr"(b)
    );
    return c;
}
/*
vuint8m1_t loadu(int index, vuint8m1_t a0, vuint8m1_t a1, vuint8m1_t a2, vuint8m1_t a3) {
    vuint8m1_t r = __riscv_vslideup_vx_u8m1(r,__riscv_vslidedown_vx_u8m1(a0, index * 8, 8), 0, 8);
    r = __riscv_vslideup_vx_u8m1(r, __riscv_vslidedown_vx_u8m1(a1, index * 8, 8), 8, 8 * 2);
    r = __riscv_vslideup_vx_u8m1(r, __riscv_vslidedown_vx_u8m1(a2, index * 8, 8), 8 * 2, 8 * 3);
    r = __riscv_vslideup_vx_u8m1(r, __riscv_vslidedown_vx_u8m1(a3, index * 8, 8), 8 * 3, 8 * 4);
    return r;
}

vint8m1_t loadi(int index, vint8m1_t a0, vint8m1_t a1, vint8m1_t a2, vint8m1_t a3) {
    vint8m1_t r = __riscv_vslideup_vx_i8m1(r, __riscv_vslidedown_vx_i8m1(a0, index * 8, 8), 0, 8);
    r = __riscv_vslideup_vx_i8m1(r, __riscv_vslidedown_vx_i8m1(a1, index * 8, 8), 8, 8 * 2);
    r = __riscv_vslideup_vx_i8m1(r, __riscv_vslidedown_vx_i8m1(a2, index * 8, 8), 8 * 2, 8 * 3);
    r = __riscv_vslideup_vx_i8m1(r, __riscv_vslidedown_vx_i8m1(a3, index * 8, 8), 8 * 3, 8 * 4);
    return r;
}
*/

/*void loadu(vuint8m1_t* a0, vuint8m1_t* a1, vuint8m1_t* a2, vuint8m1_t* a3, vuint8m1_t* t0, vuint8m1_t* t1, vuint8m1_t* t2, vuint8m1_t* t3) {
    *a0 = __riscv_vslideup_vx_u8m1(*a0, __riscv_vslidedown_vx_u8m1(*t0, 0, 8), 0, 8);
    *a0 = __riscv_vslideup_vx_u8m1(*a0, __riscv_vslidedown_vx_u8m1(*t1, 0, 8), 8, 16);
    *a0 = __riscv_vslideup_vx_u8m1(*a0, __riscv_vslidedown_vx_u8m1(*t2, 0, 8), 16, 24);
    *a0 = __riscv_vslideup_vx_u8m1(*a0, __riscv_vslidedown_vx_u8m1(*t3, 0, 8), 24, 32);
    *a1 = __riscv_vslideup_vx_u8m1(*a1, __riscv_vslidedown_vx_u8m1(*t0, 8, 8), 0, 8);
    *a1 = __riscv_vslideup_vx_u8m1(*a1, __riscv_vslidedown_vx_u8m1(*t1, 8, 8), 8, 16);
    *a1 = __riscv_vslideup_vx_u8m1(*a1, __riscv_vslidedown_vx_u8m1(*t2, 8, 8), 16, 24);
    *a1 = __riscv_vslideup_vx_u8m1(*a1, __riscv_vslidedown_vx_u8m1(*t3, 8, 8), 24, 32);
    *a2 = __riscv_vslideup_vx_u8m1(*a2, __riscv_vslidedown_vx_u8m1(*t0, 16, 8), 0, 8);
    *a2 = __riscv_vslideup_vx_u8m1(*a2, __riscv_vslidedown_vx_u8m1(*t1, 16, 8), 8, 16);
    *a2 = __riscv_vslideup_vx_u8m1(*a2, __riscv_vslidedown_vx_u8m1(*t2, 16, 8), 16, 24);
    *a2 = __riscv_vslideup_vx_u8m1(*a2, __riscv_vslidedown_vx_u8m1(*t3, 16, 8), 24, 32);
    *a3 = __riscv_vslideup_vx_u8m1(*a3, __riscv_vslidedown_vx_u8m1(*t0, 24, 8), 0, 8);
    *a3 = __riscv_vslideup_vx_u8m1(*a3, __riscv_vslidedown_vx_u8m1(*t1, 24, 8), 8, 16);
    *a3 = __riscv_vslideup_vx_u8m1(*a3, __riscv_vslidedown_vx_u8m1(*t2, 24, 8), 16, 24);
    *a3 = __riscv_vslideup_vx_u8m1(*a3, __riscv_vslidedown_vx_u8m1(*t3, 24, 8), 24, 32);
}

void loadi(vint8m1_t* a0, vint8m1_t* a1, vint8m1_t* a2, vint8m1_t* a3, vint8m1_t* t0, vint8m1_t* t1, vint8m1_t* t2, vint8m1_t* t3) {
    *a0 = __riscv_vslideup_vx_i8m1(*a0, __riscv_vslidedown_vx_i8m1(*t0, 0, 8), 0, 8);
    *a0 = __riscv_vslideup_vx_i8m1(*a0, __riscv_vslidedown_vx_i8m1(*t1, 0, 8), 8, 16);
    *a0 = __riscv_vslideup_vx_i8m1(*a0, __riscv_vslidedown_vx_i8m1(*t2, 0, 8), 16, 24);
    *a0 = __riscv_vslideup_vx_i8m1(*a0, __riscv_vslidedown_vx_i8m1(*t3, 0, 8), 24, 32);
    *a1 = __riscv_vslideup_vx_i8m1(*a1, __riscv_vslidedown_vx_i8m1(*t0, 8, 8), 0, 8);
    *a1 = __riscv_vslideup_vx_i8m1(*a1, __riscv_vslidedown_vx_i8m1(*t1, 8, 8), 8, 16);
    *a1 = __riscv_vslideup_vx_i8m1(*a1, __riscv_vslidedown_vx_i8m1(*t2, 8, 8), 16, 24);
    *a1 = __riscv_vslideup_vx_i8m1(*a1, __riscv_vslidedown_vx_i8m1(*t3, 8, 8), 24, 32);
    *a2 = __riscv_vslideup_vx_i8m1(*a2, __riscv_vslidedown_vx_i8m1(*t0, 16, 8), 0, 8);
    *a2 = __riscv_vslideup_vx_i8m1(*a2, __riscv_vslidedown_vx_i8m1(*t1, 16, 8), 8, 16);
    *a2 = __riscv_vslideup_vx_i8m1(*a2, __riscv_vslidedown_vx_i8m1(*t2, 16, 8), 16, 24);
    *a2 = __riscv_vslideup_vx_i8m1(*a2, __riscv_vslidedown_vx_i8m1(*t3, 16, 8), 24, 32);
    *a3 = __riscv_vslideup_vx_i8m1(*a3, __riscv_vslidedown_vx_i8m1(*t0, 24, 8), 0, 8);
    *a3 = __riscv_vslideup_vx_i8m1(*a3, __riscv_vslidedown_vx_i8m1(*t1, 24, 8), 8, 16);
    *a3 = __riscv_vslideup_vx_i8m1(*a3, __riscv_vslidedown_vx_i8m1(*t2, 24, 8), 16, 24);
    *a3 = __riscv_vslideup_vx_i8m1(*a3, __riscv_vslidedown_vx_i8m1(*t3, 24, 8), 24, 32);
}*/

vuint8m1_t loadu(uint8_t* addr, int stride, int vl){
    vuint64m1_t r;
    r = __riscv_vlse64_v_u64m1(reinterpret_cast<const uint64_t*>(addr), stride, vl);
    return __riscv_vreinterpret_v_u64m1_u8m1(r);
}

vint8m1_t loadi(int8_t* addr, int stride, int vl){
    vint64m1_t r;
    r = __riscv_vlse64_v_i64m1(reinterpret_cast<const int64_t*>(addr), stride, vl);
    return __riscv_vreinterpret_v_i64m1_i8m1(r);
}

void optimized_gemm(uint8_t* A, int8_t* B, int32_t* C, int m, int n, int k){
    for(int i = 0; i < 4; i++) {
        __builtin_prefetch(A + i * k * 4, 0, 3);
        __builtin_prefetch(A + i * k * 4 + k * 2, 0, 3);
    }
    vuint8m1_t a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, aa, ab, ac, ad, ae, af;// t0, t1, t2, t3;
    vint8m1_t b0, b1, b2, b3, r0, r1, r2, r3;
    vint32m2_t c;
    int stride = k * 4;
    size_t pos = 0;
    size_t vl = 8;
    for(int i = 0; i < m; i += 4) {
        for(int temp = 0; temp < 4; temp++) {
            __builtin_prefetch(A + (i + temp + 4) * stride, 0, 3);
            __builtin_prefetch(A + (i + temp + 4) * stride + stride / 2, 0, 3);
        }
        pos = 0;
        /*vl = __riscv_vsetvl_e8m1(k * 4);
        t0 = __riscv_vle8_v_u8m1(A + i * stride, vl);
        t1 = __riscv_vle8_v_u8m1(A + (i + 1) * stride, vl);
        t2 = __riscv_vle8_v_u8m1(A + (i + 2) * stride, vl);
        t3 = __riscv_vle8_v_u8m1(A + (i + 3) * stride, vl);
        loadu(&a0, &a1, &a2, &a3, &t0, &t1, &t2, &t3);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        t0 = __riscv_vle8_v_u8m1(A + i * stride + pos, vl);
        t1 = __riscv_vle8_v_u8m1(A + (i + 1) * stride + pos, vl);
        t2 = __riscv_vle8_v_u8m1(A + (i + 2) * stride + pos, vl);
        t3 = __riscv_vle8_v_u8m1(A + (i + 3) * stride + pos, vl);
        loadu(&a4, &a5, &a6, &a7, &t0, &t1, &t2, &t3);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        t0 = __riscv_vle8_v_u8m1(A + i * stride + pos, vl);
        t1 = __riscv_vle8_v_u8m1(A + (i + 1) * stride + pos, vl);
        t2 = __riscv_vle8_v_u8m1(A + (i + 2) * stride + pos, vl);
        t3 = __riscv_vle8_v_u8m1(A + (i + 3) * stride + pos, vl);
        loadu(&a8, &a9, &aa, &ab, &t0, &t1, &t2, &t3);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        t0 = __riscv_vle8_v_u8m1(A + i * stride + pos, vl);
        t1 = __riscv_vle8_v_u8m1(A + (i + 1) * stride + pos, vl);
        t2 = __riscv_vle8_v_u8m1(A + (i + 2) * stride + pos, vl);
        t3 = __riscv_vle8_v_u8m1(A + (i + 3) * stride + pos, vl);
        loadu(&ac, &ad, &ae, &af, &t0, &t1, &t2, &t3);*/
        vl = __riscv_vsetvl_e8m1(k * 4);
        a0 = loadu(A + i * stride, stride, vl);
        a1 = loadu(A + i * stride + 8, stride, vl);
        a2 = loadu(A + i * stride + 16, stride, vl);
        a3 = loadu(A + i * stride + 24, stride, vl);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        a4 = loadu(A + i * stride + pos, stride, vl);
        a5 = loadu(A + i * stride + pos + 8, stride, vl);
        a6 = loadu(A + i * stride + pos + 16, stride, vl);
        a7 = loadu(A + i * stride + pos + 24, stride, vl);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        a8 = loadu(A + i * stride + pos, stride, vl);
        a9 = loadu(A + i * stride + pos + 8, stride, vl);
        aa = loadu(A + i * stride + pos + 16, stride, vl);
        ab = loadu(A + i * stride + pos + 24, stride, vl);
        pos += vl;
        vl = __riscv_vsetvl_e8m1(k * 4 - pos);
        ac = loadu(A + i * stride + pos, stride, vl);
        ad = loadu(A + i * stride + pos + 8, stride, vl);
        ae = loadu(A + i * stride + pos + 16, stride, vl);
        af = loadu(A + i * stride + pos + 24, stride, vl);
        for(int j = 0; j < n; j += 4) {
            for(int k = 0; k < 4; k++) {
                __builtin_prefetch(B + (j + k + 4) * stride, 0, 3);
                __builtin_prefetch(B + (j + k + 4) * stride + stride / 2, 0, 3);
            }
            c = __riscv_vmv_v_x_i32m2(0, 16);
            size_t tmp = 0;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            /*r0 = __riscv_vle8_v_i8m1(B + j * stride + tmp, vl);
            r1 = __riscv_vle8_v_i8m1(B + (j + 1) * stride + tmp, vl);
            r2 = __riscv_vle8_v_i8m1(B + (j + 2) * stride + tmp, vl);
            r3 = __riscv_vle8_v_i8m1(B + (j + 3) * stride + tmp, vl);
            loadi(&b0, &b1, &b2, &b3, &r0, &r1, &r2, &r3);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a0, b0);
            r0 = __riscv_vle8_v_i8m1(B + j * stride + tmp, vl);
            c = vmdt(c, a1, b1);
            r1 = __riscv_vle8_v_i8m1(B + (j + 1) * stride + tmp, vl);
            c = vmdt(c, a2, b2);
            r2 = __riscv_vle8_v_i8m1(B + (j + 2) * stride + tmp, vl);
            c = vmdt(c, a3, b3);
            r3 = __riscv_vle8_v_i8m1(B + (j + 3) * stride + tmp, vl);
            loadi(&b0, &b1, &b2, &b3, &r0, &r1, &r2, &r3);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a4, b0);
            r0 = __riscv_vle8_v_i8m1(B + j * stride + tmp, vl);
            c = vmdt(c, a5, b1);
            r1 = __riscv_vle8_v_i8m1(B + (j + 1) * stride + tmp, vl);
            c = vmdt(c, a6, b2);
            r2 = __riscv_vle8_v_i8m1(B + (j + 2) * stride + tmp, vl);
            c = vmdt(c, a7, b3);
            r3 = __riscv_vle8_v_i8m1(B + (j + 3) * stride + tmp, vl);
            loadi(&b0, &b1, &b2, &b3, &r0, &r1, &r2, &r3);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a8, b0);
            r0 = __riscv_vle8_v_i8m1(B + j * stride + tmp, vl);
            c = vmdt(c, a9, b1);
            r1 = __riscv_vle8_v_i8m1(B + (j + 1) * stride + tmp, vl);
            c = vmdt(c, aa, b2);
            r2 = __riscv_vle8_v_i8m1(B + (j + 2) * stride + tmp, vl);
            c = vmdt(c, ab, b3);
            r3 = __riscv_vle8_v_i8m1(B + (j + 3) * stride + tmp, vl);
            loadi(&b0, &b1, &b2, &b3, &r0, &r1, &r2, &r3);
            tmp += vl;
            c = vmdt(c, ac, b0);
            c = vmdt(c, ad, b1);
            c = vmdt(c, ae, b2);
            c = vmdt(c, af, b3);*/
            b0 = loadi(B + j * stride, stride, vl);
            b1 = loadi(B + j * stride + 8, stride, vl);
            b2 = loadi(B + j * stride + 16, stride, vl);
            b3 = loadi(B + j * stride + 24, stride, vl);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a0, b0);
            c = vmdt(c, a1, b1);
            c = vmdt(c, a2, b2);
            c = vmdt(c, a3, b3);
            b0 = loadi(B + j * stride + tmp, stride, vl);
            b1 = loadi(B + j * stride + tmp + 8, stride, vl);
            b2 = loadi(B + j * stride + tmp + 16, stride, vl);
            b3 = loadi(B + j * stride + tmp + 24, stride, vl);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a4, b0);
            c = vmdt(c, a5, b1);
            c = vmdt(c, a6, b2);
            c = vmdt(c, a7, b3);
            b0 = loadi(B + j * stride + tmp, stride, vl);
            b1 = loadi(B + j * stride + tmp + 8, stride, vl);
            b2 = loadi(B + j * stride + tmp + 16, stride, vl);
            b3 = loadi(B + j * stride + tmp + 24, stride, vl);
            tmp += vl;
            vl = __riscv_vsetvl_e8m1(k * 4 - tmp);
            c = vmdt(c, a8, b0);
            c = vmdt(c, a9, b1);
            c = vmdt(c, aa, b2);
            c = vmdt(c, ab, b3);
            b0 = loadi(B + j * stride + tmp, stride, vl);
            b1 = loadi(B + j * stride + tmp + 8, stride, vl);
            b2 = loadi(B + j * stride + tmp + 16, stride, vl);
            b3 = loadi(B + j * stride + tmp + 24, stride, vl);
            c = vmdt(c, ac, b0);
            c = vmdt(c, ad, b1);
            c = vmdt(c, ae, b2);
            c = vmdt(c, af, b3);
            storei(C + i * n + j, c, n);
        }
    }
}