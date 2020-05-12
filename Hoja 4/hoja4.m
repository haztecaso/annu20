disp('Este es el código de Adrián (Hoja 4)')
format long;
nvect = 100.*2.^(0:7);
tol = 0.00001;
nmax = 60;

% Ecuación no rígida
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
jfunc = @(t,y) [-100 1; 1 -2];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

% Euler implícito - diagramas de eficiencia
N = 300;
%[t, yimpfix]   = mieulerimpfix   (f, intv, y0, N, tol, nmax);
%[t, yimpfixpc] = mieulerimpfixpc (f, intv, y0, N, tol, nmax)
[t, yimpnwt]   = mieulerimpnwt   (f, jfunc, intv, y0, N, tol, nmax);
%[t, yimpnwtpc] = mieulerimpnwtpc (f, jfunc, intv, y0, N, tol, nmax)
%plot(t,yimpfix)

figure(1)
plot(t,y(t))
figure(2)
plot(t,yimpnwt)
return

disp("Calculando errores del método de euler implícito")
for i = 1:length(nvect)
    [t, y_aprox] = mieulerimpfix(f,intv,y0,nvect(i),tol,nmax);
    err_impfix(i) = max(max(abs(y(t) - y_aprox)));

    [t, y_aprox] = mieulerimpfixpc(f,intv,y0,nvect(i),tol,nmax);
    err_impfixpc(i) = max(max(abs(y(t) - y_aprox)));

    [t, y_aprox] = mieulerimpnwt(f,jfunc,intv,y0,nvect(i),tol,nmax);
    err_impnwt(i) = max(max(abs(y(t) - y_aprox)));

    %[t, y_aprox] = mieulerimpnwtpc(f,intv,y0,nvect(i),tol,nmax);
    %err_impnwtpc(i) = max(max(abs(y(t) - y_aprox)));
end

loglog(nvect, err_impfix)
hold on
loglog(nvect, err_impfixpc)
loglog(nvect, err_impnwt)
%loglog(nvect, err_impnwtpc)
grid on
legend("eulerimpfix","eulerimpfixpc")
%legend("eulerimpfix","eulerimpfixpc","eulerimpnwt","eulerimpnwtpc")
title("Error vs N"); xlabel("N"); ylabel("Error")



return

% Cuentas
disp("Calculando errores:")
disp("euler...")
%errors_eulerimpfix = errors(@mieulerimpfix,nvect);
disp("rk4...")
%errors_rk4 = errors(@mirk4,nvect);

% Diagrama de eficiencia
figure(1)
loglog( nvect, errors_eulerimpfix, ...
        nvect, errors_rk4)
hold on
grid on
legend("euler imp fix","rk4")
title("Error máximo vs N")
xlabel("N")
ylabel("max error")
return

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
