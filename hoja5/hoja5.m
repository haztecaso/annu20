close all
clear all
format long
disp('Este es el código de Adrián (Hoja 5)')

nvect = 100.*2.^(0:7);
err = @(y, y_aprox) max(max(abs(y - y_aprox)));

% Práctica 1
x = sucesion(rand-0.5,rand-0.5,20);
n = [1: size(x,2)];
figure(1)
plot(n,x);

% Práctica 2
f = @(t, y) y;
y0 = 1;
intv = [0 10];
y = @(t) exp(t);

[t, yA] = mileapfrog(f,intv,y0,100);

for i = 1:length(nvect)
    [t, y_aprox] = mileapfrog(f,intv,y0,nvect(i));
    errors(i) = err(y(t),y_aprox);
end

figure(2)
loglog(nvect, errors)
grid on

% Práctica 3
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
y0 = [2; 3];
intv = [0 10];
y= @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

for i = 1:length(nvect)
    [t, y_aprox] = mileapfrog(f,intv,y0,nvect(i));
    errors(i) = err(y(t),y_aprox);
end

figure(3)
loglog(nvect, errors)
grid on

[t, y_aprox] = mileapfrog(f,intv,y0,1000);
figure(4)
semilogy(t,max(abs(y(t)-y_aprox)))
grid on
