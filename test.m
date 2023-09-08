function [time, x, xdot] = test

t0 = 1;
tf = 30;
x0 = 1;
xdot0 = 0;

tspan = [t0,tf];

IC = [x0,xdot0];
[time, state_v] = ode45(@g, tspan, IC);
x = state_v(:,1);
xdot = state_v(:,2);

figure(1)
clf
plot(time,x)
end

function sdot = g(t,s)

sdot = [s(2);
    (5-s(2)*sin(t)-s(1)*exp(t))/t^2];

end