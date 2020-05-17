function [x] = sucesion(x0,x1,N)
    x = x0;
    x(2) = x1;
    for n = [1:N]
        x(n+2) = 7/3*x(n+1)-2/3*x(n);
    end
end
