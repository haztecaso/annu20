#! /usr/bin/octave -qf
disp('Este es el codigo de Adrian')
f = @(t, y) [y(2); -16*y(1)+4*sin(2*t)];
intv=[0 2*pi];
y0=[0;2];
[t,y] = mieuler(f, intv, y0, 100);
size(y)
set(gca,'FontSize',16);
figure(1);
%plot(y(:,1), y(:, 2));
s=sprintf('Ecuacion de Corazon,\n met=mieuler,intv=[%g %g],\n x0=[%g %g]',intv,y0);
title(s)
grid on
hold on

[t,y] = mieulermej(f, intv, y0, 100);
set(gca,'FontSize',16);
figure(2);
plot(y(:,1), y(:, 2));
s=sprintf('Ecuacion de Corazon,\n met=mieulermej,intv=[%g %g],\n x0=[%g %g]',intv,y0);
title(s)
grid on
hold on

[t,y] = mieulermod(f, intv, y0, 100);
set(gca,'FontSize',16);
figure(3);
plot(y(:,1), y(:, 2));
s=sprintf('Ecuacion de Corazon,\n met=mieulermod,intv=[%g %g],\n x0=[%g %g]',intv,y0);
title(s)
grid on
hold on

[t,y] = mirk4(f, intv, y0, 100);
set(gca,'FontSize',16);
figure(4);
plot(y(:,1), y(:, 2));
s=sprintf('Ecuacion de Corazon,\n met=mirk4,intv=[%g %g],\n x0=[%g %g]',intv,y0);
title(s)
grid on
hold on
