close all
clear all
format long
disp('Este es el código de Adrián (Hoja 4)')
nvect = 100.*2.^(0:7);
tol = 10^(-8);
nmax = 1000;
disp(sprintf('tol = %g\tnmax = %g\n',tol,nmax));
err = @(y, y_aprox) max(max(abs(y - y_aprox)));

disp("Diagramas para una ecuación no rígida")
disp(sprintf("--------------------------------------------------------------------------\n"))
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 1 -2];
intv = [0 10];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

disp("Calculando errores para las implementaciones del método de euler implícito")
disp("--------------------------------------------------------------------------")

for i = 1:length(nvect)
    [t, y_aprox] = mieulerimpfix  (f,intv,y0,nvect(i),tol,nmax);
    err1_impfix(i) = err(y(t),y_aprox);
    [t, y_aprox] = mieulerimpfixpc(f,intv,y0,nvect(i),tol,nmax);
    err1_impfixpc(i) = err(y(t),y_aprox);
	[t, y_aprox] = mieulerimpnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err1_impnwt(i) = err(y(t),y_aprox);
    [t, y_aprox] = mieulerimpnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err1_impnwtpc(i) = err(y(t),y_aprox);
	disp(" ")
end
[err1_impfix' err1_impfixpc' err1_impnwt' err1_impnwtpc']

figure(1)
sgtitle("Ecuación no rígida.");
subplot(1,2,1)
loglog(nvect, err1_impfix)
hold on
grid on
loglog(nvect, err1_impfixpc)
loglog(nvect, err1_impnwt)
loglog(nvect, err1_impnwtpc)

legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Euler implícito "); xlabel("N"); ylabel("Error")
drawnow

disp("Calculando errores para las implementaciones del método del trapecio")
disp("--------------------------------------------------------------------------")
for i = 1:length(nvect)
    [t, y_aprox] = mitrapfix  (f,intv,y0,nvect(i),tol,nmax);
    err1_trapfix(i) = err(y(t),y_aprox);
    [t, y_aprox] = mitrapfixpc(f,intv,y0,nvect(i),tol,nmax);
    err1_trapfixpc(i) = err(y(t),y_aprox);
	[t, y_aprox] = mitrapnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err1_trapnwt(i) = err(y(t),y_aprox);
    [t, y_aprox] = mitrapnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err1_trapnwtpc(i) = err(y(t),y_aprox);
	disp(" ")
end
[err1_trapfix' err1_trapfixpc' err1_trapnwt' err1_trapnwtpc']

subplot(1,2,2)
hold off
loglog(nvect, err1_trapfix)
hold on
loglog(nvect, err1_trapfixpc)
loglog(nvect, err1_trapnwt)
loglog(nvect, err1_trapnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("trapecio "); xlabel("N"); ylabel("Error")
drawnow

disp("Diagramas para una ecuación rígida")
disp(sprintf("--------------------------------------------------------------------------\n"))
f = @(t, y) [-2 1; 998 -999]*y + [2*sin(t); 999*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 998 -999];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

disp("Calculando errores para las implementaciones del método de euler implícito")
disp("--------------------------------------------------------------------------")
for i = 1:length(nvect)
    [t, y_aprox] = mieulerimpfix  (f,intv,y0,nvect(i),tol,nmax);
    err2_impfix(i) = err(y(t),y_aprox);
    [t, y_aprox] = mieulerimpfixpc(f,intv,y0,nvect(i),tol,nmax);
    err2_impfixpc(i) = err(y(t),y_aprox);
	[t, y_aprox] = mieulerimpnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err2_impnwt(i) = err(y(t),y_aprox);
    [t, y_aprox] = mieulerimpnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err2_impnwtpc(i) = err(y(t),y_aprox);
	disp(" ")
end
[err2_impfix' err2_impfixpc' err2_impnwt' err2_impnwtpc']

figure(2)
sgtitle("Ecuación rígida.");
subplot(1,2,1)
loglog(nvect, err2_impfix)
hold on
loglog(nvect, err2_impfixpc)
loglog(nvect, err2_impnwt)
loglog(nvect, err2_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("euler implícito "); xlabel("N"); ylabel("Error")
drawnow

disp("Calculando errores para las implementaciones del método del trapecio")
disp("--------------------------------------------------------------------------")
for i = 1:length(nvect)
    [t, y_aprox] = mitrapfix  (f,intv,y0,nvect(i),tol,nmax);
    err2_trapfix(i) = err(y(t),y_aprox);
    [t, y_aprox] = mitrapfixpc(f,intv,y0,nvect(i),tol,nmax);
    err2_trapfixpc(i) = err(y(t),y_aprox);
	[t, y_aprox] = mitrapnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err2_trapnwt(i) = err(y(t),y_aprox);
    [t, y_aprox] = mitrapnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err2_trapnwtpc(i) = err(y(t),y_aprox);
	disp(" ")
end
[err2_trapfix' err2_trapfixpc' err2_trapnwt' err2_trapnwtpc']

subplot(1,2,2)
loglog(nvect, err2_impfix)
hold on
loglog(nvect, err2_impfixpc)
loglog(nvect, err2_impnwt)
loglog(nvect, err2_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("trapecio "); xlabel("N"); ylabel("Error")
drawnow
