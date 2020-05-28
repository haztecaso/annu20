function [t,y,ev,hchng_vec,err_vec] = midormandprice(f,intv,y0,TOL,hmin,hmax,fac,facmax)
    A = zeros(7);
    A(2,1)   = 1/5;
    A(3,1:2) = [3/40 9/40];
    A(4,1:3) = [44/45 -56/15 32/9];
    A(5,1:4) = [19372/6561 -25360/2187 64448/6561 -212/729];
    A(6,1:5) = [9017/3168 -355/33 46732/5247 49/176 -5103/18656];
    A(7,1:6) = [35/384 0 500/1113 125/192 -2187/6784 11/84];
    b        = [5179/57600 0 7571/16695 393/640 -92097/339200 187/2100 1/40];
    bhat     = [35/384 0 500/1113 125/192 -2187/6784 11/84 0];

    [t,y,ev,hchng_vec,err_vec] = mirkespadapt(f,intv,y0,A,b,bhat,TOL,hmin,hmax,fac,facmax);
end
