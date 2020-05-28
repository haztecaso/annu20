function [t,y,ev,hchng_vec,err_vec] = mirkespadapt(f,intv,y0,A,b,bhat,TOL,hmin,hmax,fac,facmax)
    c = sum(A');
    s = length(b); % Etapas

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
		err = abs(h*k*(b'-bhat'));
		if err < TOL
            y4 = y(:,end) + h*k*b';
			y = [y y4];
			t = [t, t(end)+h];
			err_vec = [err_vec err];
            hchng_vec = [hchng_vec h];
	    end
        h = min(hmax, h*min(facmax,fac*(TOL*h/err)^(1/5)));
        if h<hmin
			break
        end
    end

end
