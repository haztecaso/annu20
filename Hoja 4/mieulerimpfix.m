function [t, y] = mieulerimpfix(f,intv,y0,N,tol,nmax)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    for k = 1:N
        s = s + h;
        % Dato inicial <- valor anterior
        v = w;
        % Método del punto fijo
        n = 0;
        while n < nmax
            p = v;
            v = w + h*f(s,v);
            n++;
        end
        t = [t s];
        y = [y w=v];
    end
end

