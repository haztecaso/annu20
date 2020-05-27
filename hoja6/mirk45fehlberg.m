function [t,y,ev,hchng_vec,err_vec] = mirk45fehlberg(f,intv,y0,TOL,hmin,hmax,fac,facmax)
    A(1,:) = [0 0 0 0 0 0];
    A(2,:) = [1/4 0 0 0 0 0];
    A(3,:) = [3/32 9/32 0 0 0 0];
    A(4,:) = [1932/2197 -7200/2197 7296/2197 0 0 0];
    A(5,:) = [439/216 -8 3680/513 -845/4104 0 0 ];
    A(6,:) = [-8/27 2 -3544/2565 1859/4104 -11/40 0];
    b4 = [25/216 0 1408/2565 2197/4104 -1/5 0];
    b5 = [16/135 0 6656/12825 28561/56430 -9/50 2/55];

    c = sum(A');

    s = length(b4); % Etapas

    t = intv(1);
    y = y0;

    h = hmax;
    ev = 0;
    hchng_vec = [];
    err_vec = [];

    i = 0;
    while t < intv(2)
        k = f(t(end),y(:,end));
        for i=2:s
            suma = k(:,1:i-1)*A(i,1:i-1)'; %suma vectorizada
            k = [k, f(t(end)+c(i)*h, y(:,end)+h*suma)];
            if i == 5;
                k
            end
        end
        ev = ev + s;
        y4 = y(:,end) + h*k*b4';

        if isnan(y4)
            i
            y4
            return
        end
        y5 = y(:,end) + h*k*b5';
        err = abs(y4-y5);
        err_vec = [err_vec err];
        y = [y y4];
        t = [t, t(end)+h];
        h = min(hmax, h*min(facmax,fac*(TOL*h/err)^(1/5)));
        hchng_vec = [hchng_vec h];
        %h = mimin(hmax, h*mimin(facmax,fac*(TOL*h/err)^(1/5),"facmax","tol*h/err"),"hmax","");
        if h<hmin
            h = hmin;
        end
        i = i+1;
    end

end
