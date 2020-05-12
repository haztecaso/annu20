%Iternación simple + dato inicial el valor del paso anterior
function [t, y] = mieulerimpfix(f,intv,y0,N,TOL,nmax)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    for k = 1:N
        s = s + h;
        % Dato inicial = valor anterior
        v = w;
        % Punto fijo
        n = 0;
        dif = TOL+1;
        while max(dif) > TOL && n < nmax
            dif = v;
            v = w + h*f(s,v);
            dif = abs(dif-v);
            n++;
        end
        t = [t s];
        y = [y w=v];
    end
end

