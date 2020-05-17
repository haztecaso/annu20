format long;
nvect = 100.*2.^(0:7);
tol = 0.00000000001;
nmax = 1000;

f = @(x) sin(x);
t = [-2:0.03:2];

figure(1)
hold off
plot(t, f(t),'b-')
hold on
plot(t, t,'g-')
grid on

x0 = 0.01;

F = @(x) f(x) - x;
[x,n] = iterfix(F, x0, tol, nmax);
plot(x,f(x),'r*')
n
