function err = errors(met,nvect)
global f intv y0 y maxnorm;

err=[];
for i = 1:length(nvect);
    n = nvect(i);
    [t,ye] = met(f,intv,y0,n);
    err = [err maxnorm(y(t),ye)];
endfor
endfunction
