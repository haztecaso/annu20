disp('Este es el código de Adrian (Hoja 3)')

global f intv y0 y;

% Definición del problema
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
intv = [0 10];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

% Diagrama 1: Max error vs h
hvect = 0.1./(2.^(0:7));
nvect_h = ceil((intv(2)-intv(1))./hvect);

disp("Calculando diagrama 1:")
disp("euler...")
errorsh_euler = errors(@mieuler,nvect_h);
disp("eulermej...")
errorsh_eulermej = errors(@mieulermej,nvect_h);
disp("eulermod...")
errorsh_eulermod = errors(@mieulermod,nvect_h);
disp("rk4...")
errorsh_mirk4 = errors(@mirk4,nvect_h);

figure(1)
%subplot(1,3,1)
grid on
hold on

loglog(hvect,errorsh_euler)
loglog(hvect,errorsh_eulermej)
loglog(hvect,errorsh_eulermod)
loglog(hvect,errorsh_mirk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs h")
xlabel("h")
ylabel("max error")


% Diagrama 2: Max error vs h
nvect = 100.*2.^(0:7);

disp("Calculando diagrama 2:")
disp("euler...")
errorsn_euler = errors(@mieuler,nvect);
disp("eulermej...")
errorsn_eulermej = errors(@mieulermej,nvect);
disp("eulermod...")
errorsn_eulermod = errors(@mieulermod,nvect);
disp("rk4...")
errorsn_mirk4 = errors(@mirk4,nvect);

%subplot(1,3,2)
figure(2)
grid on
hold on
loglog(nvect,errorsn_euler)
loglog(nvect,errorsn_eulermej)
loglog(nvect,errorsn_eulermod)
loglog(nvect,errorsn_mirk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs N")
xlabel("N")
ylabel("max error")


% Diagrama 3: Max error vs Ev
disp("Calculando diagrama 3")
ev_euler = nvect_h;
ev_eulermej = nvect_h.*3;
ev_eulermod = nvect_h.*2;
ev_rk4 = nvect_h.*4;

figure(3)
%subplot(1,3,3)
grid on
hold on
loglog(ev_euler,errorsh_euler)
loglog(ev_eulermej,errorsh_eulermej)
loglog(ev_eulermod,errorsh_eulermod)
loglog(ev_rk4,errorsh_mirk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs Ev")
xlabel("Número de evaluaciones")
ylabel("max error")
