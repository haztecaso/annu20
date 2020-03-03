function [t, y] = mieuler(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t0;
    y = y0;
    w = y0;
    for k = 1:N
        s = s + h;
        w = w + h*f(s,w);
        t = [t s];
        y = [y w];
    end
end
