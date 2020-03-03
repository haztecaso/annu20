function [t,y] = mieulermejpablo(f,intv,y0,N)
t0 = intv(1);
tFin = intv(2);
ti = t0;
t = ti;
y_ti = y0;
y = y_ti;
h = (tFin-t0)/N;
for i = 1:1:N
    slope = f(ti,y_ti);
    slope2 = f(ti+h, y_ti+h*slope);
    ti = ti + h;
    y_ti = y_ti + h*(slope + slope2)/2;
    t = [t, ti];
    y = [y, y_ti];
end
end
