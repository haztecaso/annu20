function [t, y] = mitrapfix(f,intv,y0,N,TOL,nmax)
% Iteración: punto fijo
% Dato inicial: valor anterior
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t0;
    y = y0;
    w = y0;
    ev = 0;
    for k = 1:N
        F = @(x) w + h/2*(f(s,w)+f(s + h,x));
        s = s + h;
        [w, n] = iterfix(F, w,TOL,nmax);
        ev = ev + n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mitrapfix\tN=%g\t->\t%g ev',N,ev));
end
