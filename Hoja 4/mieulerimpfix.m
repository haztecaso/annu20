function [t, y] = mieulerimpfix(f,intv,y0,N,TOL,nmax)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    TOL
    for k = 1:N
        s = s + h;
        % Dato inicial <- valor anterior
        v = w;
        % Método del punto fijo
        n = 0;
        dif = TOL+1;
        while dif > TOL || n < nmax
            p = v;
            v = w + h*f(s,v);
            dif = p-v;
            n++;
        end
        t = [t s];
        y = [y w=v];
    end
end

