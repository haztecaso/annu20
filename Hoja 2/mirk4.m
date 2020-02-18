function [t, y] = mieuler(f,intv,y0,N)
    t0 = intv(1);
    h = (intv(2)-t0)/N;
    t = [t0:h:intv(2)];
    y(1,:) = y0;
    for k = 1:N;
        F1=f(t(k),y(k,:))';
        F2=f(t(k)+h/2,y(k,:)+h/2*F1)';
        F3=f(t(k)+h/2,y(k,:)+h/2*F2)';
        F4=f(t(k)+h,y(k,:)+h*F3)';
        y(k+1,:) = y(k,:) + h/6*(F1+2*F2+2*F3+F4);
    endfor
endfunction
