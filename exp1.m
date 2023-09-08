function [t, x] = exp1

x0 = 10^6;
t0 = 0;tf = 100;

t = [t0,tf];

[t, x_val] = ode45(@g,t,x0);
x = x_val(:,1);

%figure(5);
%clf
%plot(time,x)

end

function sdot = g(t,s)

sdot = [-s(1)];

end

