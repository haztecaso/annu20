function [t, y] = mieulerimpnwt(f,jfunc,intv,y0,N,TOL,nmax)
% Iteración: Newton
% Dato inicial: valor anterior
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    ev = 0;
    for k = 1:N
        s = s + h;
        F = @(x) x - (w + h*f(s,x));
        JF = h*jfunc(s,w);
        JF = eye(size(JF)) + JF;
        [w, n] = iternwt(F,JF,w,TOL,nmax);
        ev += n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mieulerimpnwt\tN=%g\t->\t%g ev',N,ev));
end
