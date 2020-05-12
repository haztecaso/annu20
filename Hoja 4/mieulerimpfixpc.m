%Iternación simple + dato inicial por el método de Euler
function [t, y] = mieulerimpfixpc(f,intv,y0,N,TOL,nmax)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    for k = 1:N
        % Predictor (Euler)
        v = w + h*f(s,w);
        s = s + h;
        % Punto fijo
        n = 0;
        dif = TOL+1;
        while max(abs(dif)) > TOL && n < nmax
            dif = v;
            v = w + h*f(s,v);
            dif = dif-v;
            n++;
        end
        t = [t s];
        y = [y w=v];
    end
end
