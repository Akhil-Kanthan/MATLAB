function [time, x, xdot, y] = test1

t0 = 0;tf = 10;
x0 = 0;xdot0 = 0;
y0 = 1;

t0 = 0;tf = 10;

tspan = [t0,tf];

IC = [x0,xdot0,y0];

[time, state_v] = ode45(@g, tspan, IC);
x = state_v(:,1);
xdot = state_v(:,2);
y = state_v(:,3);

figure(2)
clf
plot(time,x)
figure(3)
clf
plot(time,y)
end

function sdot = g(t,s)

sdot = [s(2);
    t^2-s(2)+4*s(1)+s(3);
    -s(2)+4*s(1)+s(3)];

end