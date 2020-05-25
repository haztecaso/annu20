function [x, n] = iternwt(F,JF,x0,tol,nmax)
% Iteración de Newton
	x = x0;
	n = 0;
	dif = 2*tol;
    x_old = x0 + tol + 1;
	while max(abs(x - x_old)) > tol
        if n == nmax
            disp(sprintf('ATENCION: iternwt ha alcanzado el máximo de iteraciones (%g)',nmax));
            break
        end
        x_old = x;
        x = x - JF\F(x);
		n = n + 1;
	end
end

