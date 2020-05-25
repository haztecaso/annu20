function [x,n] = iterfix(F,x0,tol,nmax)
% Iteración del punto fijo
	x = x0;
	n = 0;
    x_old = x0 + tol + 1;
    while max(abs(x - x_old)) > tol
        if n == nmax
            disp(sprintf('ATENCION: iterfix ha alcanzado el máximo de iteraciones (%g)',nmax));
            break
        end
        x_old = x;
        x = F(x);
        n = n + 1;
	end
end

