function [t,y,ev,hchng_vec,err_vec] = mieuler12(f,intv,y0,TOL,hmin,hmax,fac,facmax)
    A = [0 0; 1 0];
    b4 = [1 0];
    b5 = [1/2 1/2];
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
        if h<hmin
			break
        end
    end

end
