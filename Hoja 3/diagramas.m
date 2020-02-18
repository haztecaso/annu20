disp('Este es el código de Adrian (Hoja 3)')

global f intv y0 y maxnorm;
% Definición del problema
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
intv = [0 10];
y0 = [2; 3];
y = @(t) 2*e.^(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

% Máximo de las normas euclídeas
maxnorm = @(x,y) max(sqrt(sum((x-y).^2)));

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
grid on
hold on
loglog(hvect,errorsh_euler,hvect,errorsh_eulermej,hvect,errorsh_eulermod,hvect,errorsh_mirk4)
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

figure(2)
grid on
hold on
loglog(nvect,errorsn_euler,nvect,errorsn_eulermej,nvect,errorsn_eulermod,nvect,errorsn_mirk4)
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
grid on
hold on
loglog(ev_euler,errorsh_euler,ev_eulermej,errorsh_eulermej,ev_eulermod,errorsh_eulermod,ev_rk4,errorsh_mirk4)
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs Ev")
xlabel("Número de evaluaciones")
ylabel("max error")
