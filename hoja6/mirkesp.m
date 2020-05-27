function [t,y] = miRKesp(f,intv,y0,N,A,b)
    if istril(A) & (diag(A) == zeros([size(A,1),1]))
    t = intv(1);
    h = (intv(2)-intv(1))/N;
    s = length(b); % Etapas
    c = sum(A'); % Condición de suma por filas :)
    y = y0;

    for n = 1:N
        k = f(t(end),y(:,end));
        for i=2:s
            suma = k(:,1:i-1)*A(i,1:i-1)'; %suma vectorizada
            k = [k, f(t(end)+c(i)*h, y(:,end)+h*suma)];
        end
        y = [y, y(:,end) + h*k*b'];
        t = [t t(end)+h];
    end
else
    error("La matriz A no es estrictamente diagonal inferior!")
end
end
