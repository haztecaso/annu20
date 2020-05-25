clear all
format long
disp('Este es el código de Adrián (Hoja 4)')
nvect = 100.*2.^(0:7);
tol = 10^(-5);
nmax = 1000;
disp(sprintf('tol = %g\tnmax = %g\n',tol,nmax));


disp("Diagramas para una ecuación no rígida")
disp(sprintf("--------------------------------------------------------------------------\n"))
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 1 -2];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

disp("Calculando errores para las implementaciones del método de euler implícito")
disp("--------------------------------------------------------------------------")

err_impfix = 0;
err_impfixpc = 0;
err_impnwt = 0;
err_impnwtpc = 0;

for i = 1:length(nvect)
    [t, y_aprox] = mieulerimpfix  (f,intv,y0,nvect(i),tol,nmax);
    err_impfix(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mieulerimpfixpc(f,intv,y0,nvect(i),tol,nmax);
    err_impfixpc(i) = max(max(abs(y(t) - y_aprox)));
	[t, y_aprox] = mieulerimpnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_impnwt(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mieulerimpnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_impnwtpc(i) = max(max(abs(y(t) - y_aprox)));
	disp(" ")
end

figure(1)
loglog(nvect, err_impfix)
hold on
loglog(nvect, err_impfixpc)
loglog(nvect, err_impnwt)
loglog(nvect, err_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Ecuación no rígida. Diagrama de eficiencia para euler implícito (4 implementaciones)."); xlabel("N"); ylabel("Error")

disp("Calculando errores para las implementaciones del método del trapecio")
disp("--------------------------------------------------------------------------")

err_trapfix = 0;
err_trapfixpc = 0;
err_trapnwt = 0;
err_trapnwtpc = 0;
for i = 1:length(nvect)
    [t, y_aprox] = mitrapfix  (f,intv,y0,nvect(i),tol,nmax);
    err_trapfix(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mitrapfixpc(f,intv,y0,nvect(i),tol,nmax);
    err_trapfixpc(i) = max(max(abs(y(t) - y_aprox)));
	[t, y_aprox] = mitrapnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_trapnwt(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mitrapnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_trapnwtpc(i) = max(max(abs(y(t) - y_aprox)));
	disp(" ")
end

figure(2)
loglog(nvect, err_trapfix)
hold on
loglog(nvect, err_trapfixpc)
loglog(nvect, err_trapnwt)
loglog(nvect, err_trapnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Ecuación no rígida. Diagrama de eficiencia para el método del trapecio (4 implementaciones)."); xlabel("N"); ylabel("Error")

disp("Diagramas para una ecuación rígida")
disp(sprintf("--------------------------------------------------------------------------\n"))
f = @(t, y) [-2 1; 998 -999]*y + [2*sin(t); 999*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 998 -999];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

disp("Calculando errores para las implementaciones del método de euler implícito")
disp("--------------------------------------------------------------------------")

err_impfix = 0;
err_impfixpc = 0;
err_impnwt = 0;
err_impnwtpc = 0;

for i = 1:length(nvect)
    [t, y_aprox] = mieulerimpfix  (f,intv,y0,nvect(i),tol,nmax);
    err_impfix(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mieulerimpfixpc(f,intv,y0,nvect(i),tol,nmax);
    err_impfixpc(i) = max(max(abs(y(t) - y_aprox)));
	[t, y_aprox] = mieulerimpnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_impnwt(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mieulerimpnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_impnwtpc(i) = max(max(abs(y(t) - y_aprox)));
	disp(" ")
end

[err_impfix err_impfixpc err_impnwt err_impnwtpc]

figure(3)
loglog(nvect, err_impfix)
hold on
loglog(nvect, err_impfixpc)
loglog(nvect, err_impnwt)
loglog(nvect, err_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Ecuación rígida. Diagrama de eficiencia para euler implícito (4 implementaciones)."); xlabel("N"); ylabel("Error")

disp("Calculando errores para las implementaciones del método del trapecio")
disp("--------------------------------------------------------------------------")

err_trapfix = 0;
err_trapfixpc = 0;
err_trapnwt = 0;
err_trapnwtpc = 0;
for i = 1:length(nvect)
    [t, y_aprox] = mitrapfix  (f,intv,y0,nvect(i),tol,nmax);
    err_trapfix(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mitrapfixpc(f,intv,y0,nvect(i),tol,nmax);
    err_trapfixpc(i) = max(max(abs(y(t) - y_aprox)));
	[t, y_aprox] = mitrapnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_trapnwt(i) = max(max(abs(y(t) - y_aprox)));
    [t, y_aprox] = mitrapnwtpc(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_trapnwtpc(i) = max(max(abs(y(t) - y_aprox)));
	disp(" ")
end

figure(4)
loglog(nvect, err_impfix)
hold on
loglog(nvect, err_impfixpc)
loglog(nvect, err_impnwt)
loglog(nvect, err_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Ecuación rígida. Diagrama de eficiencia para el método del trapecio (4 implementaciones)."); xlabel("N"); ylabel("Error")


% Signatures

%function [teuler,yeuler,ev]          = mieulerimpfix       (f,intv,y0,N,TOL,nmax) 
%function [teuler,yeuler,ev]          = mieulerimpfixpc     (f,intv,y0,N,TOL,nmax) 
%function [tvals, yvals,ev,loopcount] = mieulerimpnwt       (f,jfunc,intv,y0,N,TOL,nmax)
%function [tvals, yvals,ev]           = mieulerimpnwtpc     (f,jfunc,intv,y0,N,TOL,nmax)
%function [ttrap,ytrap,ev,loopcount]  = mitrapfix           (f,intv,y0,N,TOL,nmax) 
%function [ttrap,ytrap,ev,loopcount]  = mitrapfixpc         (f,intv,y0,N,TOL,nmax) 
%function [ttrap,ytrap,ev,loopcount]  = mitrapnwt           (f,jfunc,intv,y0,N,TOL,nmax)
%function [ttrap,ytrap,ev,loopcount]  = mitrapnwtpc         (f,jfunc,intv,y0,N,TOL,nmax)

%function [N_vect,Ev_vect,error_vect] = fcomparerrorimpnwt  (met,func,jacfunc,intv,y0,N,yexact,M,TOL,nmax);
%function [N_vect,Ev_vect,error_vect] = fcomparerrorimpfix  (met,func,intv,y0,N,yexact,M,TOL,nmax);
%function [p,q]                       = fcalcorden          (N_vect,error_vect) 
