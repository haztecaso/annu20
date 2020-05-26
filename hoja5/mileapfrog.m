function [t, y] = mileapfrog(f,intv,y0,N)
    h = (intv(2)-intv(1))/N;
    t = linspace(intv(1),intv(2),N+1);
    y = zeros(length(y0),N+1);
    y(:,1) = y0;
    y(:,2) = y(:,1) + h*f(t(1),y(:,1));
    for k = 3:N+1
        y(:,k) = y(:,k-2) + 2*h*f(t(1),y(:,k-1));
    end
end
