% Variables globales para no tener que pasarlas como parámetros
disp('Este es el código de Adrián (Hoja 4)')
% Definición del problema
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

N=100;
[t, yrk] = mirk4(f,intv,y0,N);
[t, yimp] = mieulerimpfix(f,intv,y0,N,0.1,20);

nvect = 100.*2.^(0:7);


% Cuentas
disp("Calculando errores:")
disp("euler...")
errors_eulerimpfix = errors(@mieulerimpfix,nvect);
disp("rk4...")
errors_rk4 = errors(@mirk4,nvect);

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
