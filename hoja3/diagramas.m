disp('Este es el código de Adrián (Hoja 3)')
%Variables globales para no tener que pasarlas como parámetro a la función errors.
global f intv y0 y;
% Definición del problema
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
intv = [0 10];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

nvect = 100.*2.^(0:7);
hvect = (intv(2)-intv(1))./nvect;

% Cuentas
fprintf('%s ', "Calculando errores:");
fprintf('%s', "euler");
errors_euler = errors(@mieuler,nvect);
fprintf(', %s', "eulermej");
errors_eulermej = errors(@mieulermej,nvect);
fprintf(', %s', "eulermod");
errors_eulermod = errors(@mieulermod,nvect);
fprintf(', %s', "rk4");
errors_rk4 = errors(@mirk4,nvect);
disp('.');

% Diagrama 1: Max error vs h
figure(1)
loglog( hvect, errors_euler, ...
        hvect, errors_eulermej, ...
        hvect, errors_eulermod, ...
        hvect, errors_rk4)
hold on
grid on
legend("euler","eulermej","eulermod","rk4")
title("Error vs h"); xlabel("h"); ylabel("Error");

% Diagrama 2: Max error vs N
figure(2)
loglog( nvect, errors_euler, ...
        nvect, errors_eulermej, ...
        nvect, errors_eulermod, ...
        nvect, errors_rk4)
hold on
grid on
legend("euler","eulermej","eulermod","rk4")
title("Error vs N"); xlabel("N"); ylabel("Error")

% Diagrama 3: Max error vs Ev
figure(3)
loglog( nvect,errors_euler, ...
        nvect*2,errors_eulermej, ...
        nvect*2,errors_eulermod, ...
        nvect*4,errors_rk4)
hold on
grid on
legend("euler","eulermej","eulermod","rk4")
title("Error vs NEv"); xlabel("Número de evaluaciones"); ylabel("Error")

% Pendientes
disp("Pendientes del primer gráfico")
pendiente = @(a,b) [(log(a(7))-log(a(1)))/(log(b(7))-log(b(1)))];
pendiente_euler    = pendiente(errors_euler, hvect)
pendiente_eulermej = pendiente(errors_eulermej, hvect)
pendiente_eulermod = pendiente(errors_eulermod, hvect)
pendiente_rk4      = pendiente(errors_rk4, hvect)
