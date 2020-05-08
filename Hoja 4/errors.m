function err = errors(met,nvect)
    global f intv y0 y;
    err=zeros(1, length(nvect));
    for i = 1:length(nvect)
        n = nvect(i);
        [t, y_aprox] = met(f, intv, y0, n);
        err(i) = max(max(abs(y(t) - y_aprox)));
    end
end
