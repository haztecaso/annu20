close all
clear all
format long
disp('Este es el código de Adrián (Hoja 6)')

% Par encajado: Runge-Kutta Fehlberg

tol = 0.01;
fac = 0.9;
facmax = 4;
hmin = 10^(-5);

% Practica 5
f = @(t, x) x^2;
y0 = 1;
intv = [0 2];
y = @(t) 1/(1-t); % Solución exacta

hmax = (intv(2)-intv(1))/50;

if false
[t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,y0,tol,hmin,hmax,fac,facmax);
figure(1)
subplot(2,2,1)
plot(t,y)
ylabel("y");
xlabel("t");
title("mirk45felhberg");
drawnow

subplot(2,2,2)
[t,y,ev,hchng_vec,err_vec] = mieuler12(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("mieuler12");
drawnow

subplot(2,2,3)
[t,y,ev,hchng_vec,err_vec] = mieuler21(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("mieuler21");
drawnow

subplot(2,2,4)
[t,y,ev,hchng_vec,err_vec] = midormandprice(f,intv,y0,tol,hmin,hmax,fac,facmax);
plot(t,y)
ylabel("y");
xlabel("t");
title("midormandprice");
drawnow
end

% Practica 6
f = @(t, y) [-2 1; 998 -999]*y + [2*sin(t); 999*(cos(t)-sin(t))];
jfunc = @(t,y) [-2 1; 998 -999];
intv = [0 20];
y0 = [2; 3];
sol = @(t) 2*exp(-t).*[1; 1]+[sin(t); cos(t)]; % Solución exacta
err = @(y, y_aprox) max(max(abs(y - y_aprox)));

tol = 0.01
figure(2)
for i = 1:10
	disp(sprintf("\ntol = %g, i = %g",tol,i));
	disp("rk45");
    [t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,y0,tol,hmin,hmax,fac,facmax);
    errors(1,i) = err(sol(t),y);
	evs(1,i) = ev;

	disp("euler12");
    [t,y,ev,hchng_vec,err_vec] = mieuler12(f,intv,y0,tol,hmin,hmax,fac,facmax);
    errors(2,i) = err(sol(t),y);
	evs(2,i) = ev;

	disp("euler21");
    [t,y,ev,hchng_vec,err_vec] = mieuler21(f,intv,y0,tol,hmin,hmax,fac,facmax);
    errors(3,i) = err(sol(t),y);
	evs(3,i) = ev;

	disp("dormand price");
    [t,y,ev,hchng_vec,err_vec] = midormandprice(f,intv,y0,tol,hmin,hmax,fac,facmax);
    errors(4,i) = err(sol(t),y);
	evs(4,i) = ev;

	tol = tol/2;
	if i > 1
		hold off
		loglog(evs(1,:),errors(1,:))
		hold on
		grid on
		loglog(evs(2,:),errors(2,:))
		loglog(evs(3,:),errors(3,:))
		loglog(evs(4,:),errors(4,:))
		ylabel("Error");
		xlabel("Evaluaciones");
		title(sprintf("diagrama de eficiencia para tol entre %g y %g",0.01,tol));
		legend("mirk45fehlberg","mieuler12","mieuler21","midormandprice")
		drawnow
	end
end
