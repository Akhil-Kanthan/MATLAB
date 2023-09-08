function [t, y] = runge_kutta_solver_AkhilKanthan(odefcn, tspan, y0, cAb, N)
    % Extract c, A, and b from cAb
    c = cAb(1:end-1, 1);
    A = cAb(1:end-1, 2:end);
    b = cAb(end, 2:end);
    
    % Initialize t and y
    t = linspace(tspan(1), tspan(2), N+1);
    y = zeros(N+1, length(y0));
    y(1, :) = y0;
    
    % Step size
    h = (tspan(2) - tspan(1))/N;
    
    % Loop over time steps
    for i = 1:N
        % Call general_runge_kutta_step function
        y_next = general_runge_kutta_step(odefcn, t(i), y(i,:), c, A, b, h);
        y(i+1, :) = y_next;
    end
end

function y_next = general_runge_kutta_step(odefcn, t, y, c, A, b, h)
    s = length(c);
    k = zeros(s, length(y));
    for i = 1:s
        % Compute k_i
        k(i,:) = odefcn(t + c(i)*h, y + h*k.*A(:,i));
    end
    % Compute y_next
    y_next = y + h*k*b;
end