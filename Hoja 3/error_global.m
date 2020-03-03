function [err] = error_global(met,f,f_exact,intv,x0,N)
y_exact = [];
[t,y_euler] = met(f,intv,x0,N);
for i = t
    y_exact = [y_exact f_exact(i)];
end
er_M = abs(y_exact - y_euler);
err= max(er_M(:));
end
