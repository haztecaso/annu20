function [t,y,ev,hchng_vec,err_vec] = mieuler12(f,intv,y0,TOL,hmin,hmax,fac,facmax)
    A = [0 0; 1 0];
    b = [1/2 1/2];
    bhat = [1 0];
    [t,y,ev,hchng_vec,err_vec] = mirkespadapt(f,intv,y0,A,b,bhat,TOL,hmin,hmax,fac,facmax);
end
