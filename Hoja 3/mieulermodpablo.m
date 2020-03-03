function [t,y] = mieulermodpablo(f,intv,y0,N)
% Numerical integration using the Modified Euler Method for ODE's
% f = multivariate function to whose numerical integration we seek
% intv = [t0 tEnd]; t0 = initial time ; tEnd = final time of integration
% y0 = initial conditions for the IVP;
% N = number of subintervals for the integration;
t0 = intv(1);
tFin = intv(2);
ti = t0;
t = ti;
y_ti = y0;
y = y_ti;
h = (tFin-t0)/N;
for i = 1:1:N
    slope = f(ti,y_ti);
    slope = f(ti+h/2, y_ti+h/2*slope);
    ti = ti + h;
    y_ti = y_ti + h*slope;
    t = [t, ti];
    y = [y, y_ti];
end
end
