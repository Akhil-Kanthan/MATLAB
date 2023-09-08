odefcn = @(t,y) -y+t^2+1;
t_span = [0, 10];

y0 = 0;

cAb = [0   0   0   0   0
       0.5 0.5 0   0   0
       0.5 0   0.5 0   0
       1   0   0   1   0
       0   1/6 1/3 1/3 1/6];

N = 10;

[t,y] = runge_kutta_solver_AkhilKanthan(odefcn, t_span, y0, cAb, N)

[t2, y2] = ode45(odefcn, t_span, y0);

figure(1)
plot(t,y);
figure(2)
plot(t2,y2)