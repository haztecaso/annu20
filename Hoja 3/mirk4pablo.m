function [t,y] = mirk4pablo(f,intv,y0,N)
% Numerical integration using the Runge-Kutta Order 4 Method for ODE's
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
    F1 = f(ti,y_ti);
    F2 = f(ti+h/2, y_ti+h/2*F1);
    F3 = f(ti+h/2, y_ti+h/2*F2);
    F4 = f(ti+h, y_ti+h*F3);
    phi = 1/6*(F1+F2*2+F3*2+F4);
    ti = ti + h;
    y_ti = y_ti + h*phi;
    t = [t, ti];
    y = [y, y_ti];
end
end
