close all
clear all
format long
disp('Este es el código de Adrián (Hoja 6)')

% Par encajado: Runge-Kutta Fehlberg

tol = 0.01;
fac = 0.9;
facmax = 4;
hmin = 10^(-5);

f = @(t, x) x^2;
x0 = 1;
intv = [0 2];
x = @(t) 1/(1-t); % Solución exacta

hmax = (intv(2)-intv(1))/50;


[t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,x0,tol,hmin,hmax,fac,facmax);

plot(t,y)
ev
size(t)
