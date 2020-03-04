disp('Este es el código de Adrian (Hoja 3)')
format long
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
disp("Calculando errores:")
disp("euler...")
errors_euler = errors(@mieuler,nvect);
disp("eulermej...")
errors_eulermej = errors(@mieulermej,nvect);
disp("eulermod...")
errors_eulermod = errors(@mieulermod,nvect);
disp("rk4...")
errors_rk4 = errors(@mirk4,nvect);

% Diagrama 1: Max error vs h
figure
grid on
hold on
loglog( hvect, errors_euler, ...
        hvect, errors_eulermej, ...
        hvect, errors_eulermod, ...
        hvect, errors_rk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs h")
xlabel("h")
ylabel("max error")

% Diagrama 2: Max error vs h
figure
grid on
hold on
loglog( nvect, errors_euler, ...
        nvect, errors_eulermej, ...
        nvect, errors_eulermod, ...
        nvect, errors_rk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs N")
xlabel("N")
ylabel("max error")

% Diagrama 3: Max error vs Ev
disp("Calculando diagrama 3")
figure
grid on
hold on
loglog( nvect,errors_euler, ...
        nvect*2,errors_eulermej, ...
        nvect*2,errors_eulermod, ...
        nvect*4,errors_rk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs Ev")
xlabel("Número de evaluaciones")
ylabel("max error")

% Pendientes

disp("Pendientes del segundo gráfico")
pendiente_euler = (log(errors_euler(6))-log(errors_euler(i,1)))/(log(nvect(6))-log(nvect(1)));
pendiente_eulermej = (log(errors_eulermej(6))-log(errors_eulermej(i,1)))/(log(nvect(6))-log(nvect(1)));
pendiente_eulermod= (log(errors_eulermod(6))-log(errors_eulermod(i,1)))/(log(nvect(6))-log(nvect(1)));
pendiente_rk4 = (log(errors_rk4(6))-log(errors_rk4(i,1)))/(log(nvect(6))-log(nvect(1)));
