function [t, y] = runge_kutta_solver_<your-name>(odefcn, tspan, y0, cAb, N)

c = cAb([1:end-1],1)
b = cAb(end,:)
A = cAb([1:end-1],[2:end])

a = t0
b = tf

tspan = [a,b]

y = zeros(N+1,d)

[t,y]= ode45(@y_next,tspan,y0)
end

function y_next = general_runge_kutta_step(ode_fct, t, y, cAb, stepsize)


