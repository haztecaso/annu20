function err = errors(met,nvect)
    global f intv y0 y;

    err=[];
    for i = 1:length(nvect)
        n = nvect(i);
        [t,ye] = met(f,intv,y0,n);
        maxnorm = max(sqrt(sum((y(t)-ye).^2))); %max de la norma euclidea
        err = [err maxnorm];
    end
end