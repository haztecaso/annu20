format long;
nvect = 100.*2.^(0:7);
tol = 0.00000000001;
nmax = 1000;

f = @(t, y) [y(2); -16*y(1)+4*sin(2*t)];
intv=[0 2*pi];
y0=[0;2];

i = 0
for N = nvect
    i++
    [t, y1] = mitrapfix(f,intv,y0,N,tol,nmax);
    [t, y2] = mitrapfixpc(f,intv,y0,N,tol,nmax);
    figure(i)
    plot(y1(1,:),y1(2,:),'g-',y2(1,:),y2(2,:),'r*')
    title(N)
end
