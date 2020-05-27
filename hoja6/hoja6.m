close all
clear all
format long
disp('Este es el código de Adrián (Hoja 6)')

% Par encajado: Runge-Kutta Fehlberg
A = zeros(6);
A(2,1)   = 1/4;
A(3,1:2) = [3/32 9/32];
A(4,1:3) = [1932/2197 -7200/2197 7296/2197];
A(5,1:4) = [439/216 -8 3680/513 -845/4104];
A(6,1:5) = [-8/27 2 -3544/2565 1859/4104 -11/40];
c = sum(A');
b = [25/216 0 1408/2565 2197/4104 -1/5];
bb = [16/135 0 6656/12825 28561/56430 -9/50 2/55];

hmin = 10^(-5);