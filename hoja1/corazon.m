disp('Eso es el codigo de UB')
f = @(t, y) [y(2); -16*y(1)+4*sin(2*t)];
met='ode45';
intv=[0 2*pi];
x0=[0;2];
[t,y] = ode45(f, intv, x0)
i=1;
figure(i)
set(gca,'FontSize',16);
plot(t, y(:, 1), 'go-', t, y(:, 2), 'r+-')
s=sprintf('Ecuacion de Corazon,\n met=%s,intv=[%g %g],\n x0=[%g %g]',met,intv,x0);
title(s)
grid on
i=2;
figure(i)
set(gca,'FontSize',16);
hold on 
plot(y(:,1),y(:,2),'r-+')
hold off
grid on
s=sprintf('Diagrama de fase (Corazon),\n met=%s,intv=[%g %g],\n x0=[%g %g]',met,intv,x0);
title(s)
