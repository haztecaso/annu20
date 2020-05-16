function [t, y] = mitrapfixpc(f,intv,y0,N,TOL,nmax)
% Iteración: punto fijo
% Dato inicial: predictor (Euler)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    ev = 0;
    for k = 1:N
        F = @(x) w + h/2*(f(s,w)+f(s + h,x));
        s = s + h;
        w0 = w + h*f(s,w);
        [w,n] = iterfix(F,w0,TOL,nmax);
        ev += n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mitrapfixpc\tN=%g\t->\t%g ev',N,ev));
end
