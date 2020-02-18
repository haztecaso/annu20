function [t, y] = mieulermod(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = [t0:h:intv(2)];
    y(1,:) = y0;
    for k = 1:N;
        y(k+1,:) = y(k,:) + h/2*( f(t(k),y(k,:))' + f(t(k),y(k,:) + h*f(t(k),y(k,:))' )' );
        f(t(k), y(k,:)).';
    endfor
endfunction
