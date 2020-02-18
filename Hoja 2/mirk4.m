function [t, y] = mirk4(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = t0;
    s = t;
    y = y0;
    w = y;
    for k = 1:N;
        s = s + h;
        F1=f(s,w);
        F2=f(s+h/2,w+h/2*F1);
        F3=f(s+h/2,w+h/2*F2);
        F4=f(s+h,w+h*F3);
        w = w + h/6*(F1+2*F2+2*F3+F4);
        t = [t s];
        y = [y w];
    end
end
