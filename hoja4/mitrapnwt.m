function [t, y] = mitrapnwt(f,jfunc,intv,y0,N,TOL,nmax)
% Iteración: Newton
% Dato inicial: valor anterior
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t0;
    y = y0;
    w = y0;
    ev = 0;
    for k = 1:N
        F = @(x) x - (w + h/2*(f(s,w)+f(s + h,x)));
        s = s + h;
        JF = h/2*jfunc(s,w);
        JF = eye(size(JF)) + JF;
        [w, n] = iternwt(F,JF,w,TOL,nmax);
        ev = ev + n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mitrapnwt\tN=%g\t->\t%g ev',N,ev));
end
