function [t, y] = mieulerimpnwtpc(f,jfunc,intv,y0,N,TOL,nmax)
% Iteración: Newton
% Dato inicial: predictor (Euler)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t0;
    y = y0;
    w = y0;
    ev = 0;
    for k = 1:N
        s = s + h;
        F = @(x) x - (w + h*f(s,x));
        JF = h*jfunc(s,w);
        JF = eye(size(JF)) + JF;
		w0 = w + h*f(s,w);
        [w, n] = iternwt(F,JF,w0,TOL,nmax);
        ev = ev + n;
        t = [t s];
        y = [y w];
    end
    disp(sprintf('mieulerimpnwtpc\tN=%g\t->\t%g ev',N,ev));
end
