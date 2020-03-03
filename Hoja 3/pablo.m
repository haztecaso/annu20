%% Datos del Problema
disp('Eso es el codigo de Pab')
intv = [0 10];
x0 = [2; 3];
N0 = 100;
f = @(t,y) [-2*y(1)+ y(2) + 2*sin(t) ; y(1) - 2*y(2) + 2*(cos(t)-sin(t))];
f_exact = @(t) [2*exp(-t) + sin(t); 2*exp(-t) + cos(t)];
s=sprintf("y'= [2y_1 + y_2 + 2sint; y_1 - 2y_2 +2(cost-sint)];\n intv=[%g %g];\n x0=[%g %g];",intv,x0);
N=[];
for j=1:7
    N(j)=N0*2^j;
    h(j)=1/N(j);
end

%% Resolucion del Problema
Method_Handle={@mieulerpablo, @mieulermodpablo, @mieulermejpablo, @mirk4pablo};
Method_Name={'Euler','Euler Modificado', 'Euler Mejorado', 'Runge-Kutta 4'};
Method_N_Eval=[1,2,2,4];

er_met=[];
for i=1:4
    er_current_met=[];
    for n=N
        er_current_met = [er_current_met error_global(Method_Handle{i},f,f_exact,intv,x0,n)];
    end
    er_met = [er_met; er_current_met];
end

%% Grafica del Error vs N
figure(1)
for i=1:4
    loglog(N,er_met(i,:),"o-",'DisplayName', Method_Name{i})
    hold on
end
grid on
title(s)
legend show
xlabel("N")
ylabel("Error")
hold off

%% Grafica del Error vs h
figure(2)
for i=1:4
    slope = (log(er_met(i,6))-log(er_met(i,1)))/(log(h(6))-log(h(1)));
    disp(sprintf('The slope for %s is %.2g (rounded to the closest decimal)',Method_Name{i}, slope))
    loglog(h,er_met(i,:),"o-",'DisplayName', Method_Name{i})
    hold on
end
grid on
legend show
xlabel("h")
ylabel("Error")
hold off

%% Grafica del Error vs N evaluaciones
figure(3)
for i=1:4
    loglog(N*Method_N_Eval(i),er_met(i,:),"o-",'DisplayName', Method_Name{i})
    hold on
end
grid on
legend show
xlabel("N evaluaciones")
ylabel("Error")
hold off

%% Apéndice código: funciones de Euler, Euler modificado, Euler mejorado y Runge-Kutta 4, para calcular y pintar el diagrama de eficiencia y el orden


