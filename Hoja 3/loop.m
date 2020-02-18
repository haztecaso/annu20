function loop()
    [t,ye] = mieuler(f,intv,y0,100);
    maxnorm(y(t),ye)
endfunction
