function [t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,y0,TOL,hmin,hmax,fac,facmax)
    A(1,:) = [0 0 0 0 0 0];
    A(2,:) = [1/4 0 0 0 0 0];
    A(3,:) = [3/32 9/32 0 0 0 0];
    A(4,:) = [1932/2197 -7200/2197 7296/2197 0 0 0];
    A(5,:) = [439/216 -8 3680/513 -845/4104 0 0 ];
    A(6,:) = [-8/27 2 -3544/2565 1859/4104 -11/40 0];
    b = [25/216 0 1408/2565 2197/4104 -1/5 0];
    bhat = [16/135 0 6656/12825 28561/56430 -9/50 2/55];
    [t,y,ev,hchng_vec,err_vec] = mirkespadapt(f,intv,y0,A,b,bhat,TOL,hmin,hmax,fac,facmax);
end
