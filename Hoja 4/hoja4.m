disp('Este es el código de Adrián (Hoja 4)')
graphics_toolkit("gnuplot")
% Definición del problema
f = @(t, y) [-2 1; 1 -2]*y + [2*sin(t); 2*(cos(t)-sin(t))];
intv = [0 20];
y0 = [2; 3];
y = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta

N=100;
[t, yrk] = mirk4(f,intv,y0,N);
[t, yimp] = mieulerimpfix(f,intv,y0,N,0.1,20);
figure(1)
plot(yrk(1,:),yrk(2,:),"r")
hold on
plot(yimp(1,:),yimp(2,:),"b")
hold off
grid on
legend("rk","imp")

nvect = 100.*2.^(0:7);

return

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

% Diagrama de eficiencia
figure
loglog( nvect, errors_euler, ...
        nvect, errors_eulermej, ...
        nvect, errors_eulermod, ...
        nvect, errors_rk4)
hold on
grid on
legend("euler","eulermej","eulermod","rk4")
title("Error máximo vs N")
xlabel("N")
ylabel("max error")
