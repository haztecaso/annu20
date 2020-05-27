syms y1(t) y2(t);

A = [-2 1; 1 -2];
B = @(t) [2*sin(t); 2*(cos(t)-sin(t))];
edo = [diff(y1,t); diff(y2,t)] == A*[y1; y2] + B(t);
cond = [y1(0) == 2, y2(0) == 3];
sol = dsolve(edo,cond);

disp("Solución exacta de la ecuación no rígida.")
disp(sprintf('y1 = %s',sol.y1));
disp(sprintf('y2 = %s',sol.y2));

clear all

syms y1(t) y2(t);

A = [-2 1; 998 -999];
B = @(t) [2*sin(t); 999*(cos(t)-sin(t))];
edo = [diff(y1,t); diff(y2,t)] == A*[y1; y2] + B(t);
cond = [y1(0) == 2, y2(0) == 3];
sol = dsolve(edo,cond);

disp("Solución exacta de la ecuación rígida.")
disp(sprintf('y1 = %s',sol.y1));
disp(sprintf('y2 = %s',sol.y2));
