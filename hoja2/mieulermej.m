function [t, y] = mieulermej(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t;
    y = y0;
    w = y;
    for k = 1:N
        tmp = f(s,w);
        w = w + h/2*(tmp + f(s+h,w + h*tmp));
        s = s + h;
        t = [t s];
        y = [y w];
    end
end
