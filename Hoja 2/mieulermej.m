function [t, y] = mieulermej(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t;
    y = y0;
    w = y;
    for k = 1:N;
        s = s + h;
        w = w + h/2*(f(s,w) + f(s,w + h*f(s,w)));
        t = [t s];
        y = [y w];
    endfor
endfunction
