function [t, y] = mieulerimpfix(f,intv,y0,N,TOL,nmax)
% Iteración: punto fijo
% Dato inicial: valor anterior
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    ev = 0;
    for k = 1:N
        s = s + h;
        F = @(x)  w + h * f(s,x);
        [w, n] = iterfix(F, w,TOL,nmax);
        ev += n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mieulerimpfix\tN=%g\t->\t%g ev',N,ev));
end
