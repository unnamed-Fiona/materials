subroutine memmove(dst, src, N)
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    implicit none

    integer, intent(in) :: N
    real(dp) :: dst(*)
    real(dp), intent(in) ::src(*)
    integer :: i
    do i=1,N
        dst(i) = src(i)
    end do
end subroutine memmove

subroutine gemv(y,A,x,N)
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    implicit none

    real(dp) :: y(*)
    real(dp), intent(in) :: A(*)
    real(dp), intent(in) :: x(*)
    integer, intent(in) :: N
    integer :: i
    integer :: j
    do i=1,N
        y(i) = 0
        do j=1,N
            y(i) = y(i) + A((i - 1)*N+j) * x(j)
        end do
    end do
end subroutine gemv


module own_dot
  use, intrinsic :: iso_fortran_env, only: sp => real32, dp => real64
  implicit none
contains

real(dp) function dot_product(x,y,N) result(res)
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    implicit none

    real(dp), intent(in) :: x(*)
    real(dp), intent(in) :: y(*)
    integer,intent(in) :: N
    integer :: i
    res = 0
    
    do i=1,N
        res = res + x(i) * y(i)
    end do

end function dot_product

end module own_dot

subroutine precondition(A, K2_inv, N)
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    implicit none

    real(dp), intent(in) :: A(*)
    real(dp) :: K2_inv(*)
    integer, intent(in) :: N
    integer :: i
    do i = 1,N
        K2_inv(i) = 1.0 / A((i - 1) * N + i)
    end do
end subroutine precondition

subroutine precondition_apply(z,K2_inv,r,N)
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    implicit none

    real(dp), intent(in) :: K2_inv(*)
    real(dp), intent(in) :: r(*)
    real(dp) :: z(*)
    integer, intent(in) :: N
    integer :: i
    do i=1,N
        z(i) = r(i) * K2_inv(i)
    end do
end subroutine precondition_apply

function bicgstab(N, A, b, x, tol, maxit) result(iter) bind(C, name="bicgstab")
    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    use, intrinsic :: iso_c_binding
    use :: own_dot
    implicit none

    ! Add parameter binding here, eg:
    integer(c_int), intent(in), value :: N
    integer(c_int), intent(in), value :: maxit
    real(c_double), intent(in), value :: tol
    real(c_double), intent(in) :: A(*)
    real(c_double), intent(in) :: b(*)
    real(c_double) :: x(*)

    

    ! Add local variables here, eg:
    integer :: iter
    real(dp) :: r(N)
    real(dp) :: r_hat(N)
    real(dp) :: p(N)
    real(dp) :: v(N)
    real(dp) :: s(N)
    real(dp) :: h(N)
    real(dp) :: t(N)
    real(dp) :: y(N)
    real(dp) :: z(N)
    real(dp) :: K2_inv(N)

    real(dp) :: rho_old = 1
    real(dp) :: alpha = 1
    real(dp) :: omega = 1
    real(dp) :: rho = 1
    real(dp) :: beta = 1
    real(dp) :: tol_squared
    integer :: i


    ! Start your implementation here

    tol_squared = tol * tol

    call precondition(A, K2_inv, N)

    call gemv(r, A, x, N)

    do i = 1, N
        r(i) = b(i) - r(i)
    end do

    call memmove(r_hat, r, N)

    rho = dot_product(r_hat, r, N)

    call memmove(p, r, N)

    iter = 1
    do iter = 1, maxit
        !print *, dot_product(r,r,N)
        if (iter - iter / 1000 * 1000 == 0) then
            print *, "Iteration", iter, ", residul = ", sqrt(dot_product(r,r,N))
        end if

        call precondition_apply(y, K2_inv, p, N)
        !print *, A(1), A(9*N+10)
        !print *, p(1), K2_inv(1), p(10), K2_inv(10)
        !print *, y(1), y(10)

        call gemv(v, A, y, N)

        alpha = rho / dot_product(r_hat, v, N)
        !print *, alpha, dot_product(r_hat, v, N)

        do i=1,N
            h(i) = x(i) + alpha * y(i)
        end do

        do i=1,N
            s(i) = r(i) - alpha * v(i)
        end do

        if (dot_product(s, s, N) < tol_squared) then
            call memmove(x,h,N)
            exit
        end if

        call precondition_apply(z, K2_inv, s, N)

        call gemv(t, A, z, N)

        omega = dot_product(t, s, N) / dot_product(t, t, N)
        ! print *, dot_product(t, t, N)

        do i = 1,N
            x(i) = h(i) + omega * z(i)
        end do

        do i = 1,N
            r(i) = s(i) - omega * t(i)
        end do

        if (dot_product(r, r, N) < tol_squared) then
            exit
        end if

        rho_old = rho

        rho = dot_product(r_hat, r, N)

        beta = (rho / rho_old) * (alpha / omega)

        do i = 1,N
            p(i) = r(i) + beta * (p(i) - omega * v(i))
        end do

    end do

end function bicgstab