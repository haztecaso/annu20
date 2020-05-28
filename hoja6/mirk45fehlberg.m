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

    while t < intv(2)
        k = f(t(end),y(:,end));
        for i=2:s
            suma = k(:,1:i-1)*A(i,1:i-1)'; %suma vectorizada
            k = [k, f(t(end)+c(i)*h, y(:,end)+h*suma)];
        end
        ev = ev + s;
		err = abs(h*k*(b4'-b5'));
		if err < TOL
            y4 = y(:,end) + h*k*b4';
			y = [y y4];
			t = [t, t(end)+h];
			err_vec = [err_vec err];
            hchng_vec = [hchng_vec h];
	    end
        h = min(hmax, h*min(facmax,fac*(TOL*h/err)^(1/5)));
        %h = mimin(hmax, h*mimin(facmax,fac*(TOL*h/err)^(1/5),"facmax","tol*h/err"),"hmax","");
        if h<hmin
			break
        end
		disp(t(end))
    end

end
