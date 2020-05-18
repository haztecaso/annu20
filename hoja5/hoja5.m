close all
clear all
format long
disp('Este es el código de Adrián (Hoja 5)')

x = sucesion(100,-0.01,10);
n = [1: size(x)(2)];

plot(n,x);
