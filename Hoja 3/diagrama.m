#! /usr/bin/octave -qf
disp('Este es el codigo de Adrian')

A = [-2 1; 1 -2];
B = @(t) [2*sin(t); 2*(cos(t)-sin(t))];
f = @(t, y) A*y' + B(t);
intv = [0 10];
y0 = [2; 3];
y= @(t, y) 2*e^(-t)*[1; 1]+[sin(t); cos(t)];

[t,ye] = mieuler(f,intv,y0,100);

for i=t;
endfor
