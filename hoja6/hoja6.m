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
y0 = 1;
intv = [0 2];
y = @(t) 1/(1-t); % Solución exacta

hmax = (intv(2)-intv(1))/50;


[t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,y0,tol,hmin,hmax,fac,facmax);
figure(1)
subplot(2,2,1)
plot(t,y)
ylabel("y");
xlabel("t");
title("mirk45felhberg");
drawnow

subplot(2,2,2)
[t,y,ev,hchng_vec,err_vec] = mieuler12(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("mieuler12");
drawnow

subplot(2,2,3)
[t,y,ev,hchng_vec,err_vec] = mieuler21(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("mieuler21");
drawnow

subplot(2,2,4)
[t,y,ev,hchng_vec,err_vec] = midormandprice(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("midormandprice");
drawnow


f = @(t, y) [-2 1; 998 -999]*y + [2*sin(t); 999*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 998 -999];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta
