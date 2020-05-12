%Iternación tipo Newton + dato inicial el valor del paso anterior
function [t, y] = mieulerimpnwt(f,jfunc,intv,y0,N,TOL,nmax)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = s = t0;
    y = w = y0;
    for k = 1:N
        s = s + h;
        % Dato inicial = valor anterior
        v = w;
        % Newton
        n = 0;
        dif = TOL+1;
        format short
        while max(dif) > TOL && n < nmax
            dif = v;
            v = v - jfunc(s,v)\f(s,v);
            dif = dif-v;
            disp(dif)
            n++;
        end
        t = [t s];
        y = [y w=v];
    end
end
