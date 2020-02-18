function err = errors(met,nvect)
global f;
global intv;
global y0;
global y;
global maxnorm;

err=[];
for n = nvect;
    [t,ye] = met(f,intv,y0,n);
    err = [err maxnorm(y(t),ye)];
endfor
endfunction
