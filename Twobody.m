function dy = Twobody(t,y)
dy = zeros(4,1);

%Position
xx=y(1);
yy=y(2);

%Radius
r=(xx.^2+yy.^2).^0.5;

%Constants
M=10^30;
G=6.67*10^-11;

%dX/dt
dy(1)=y(3); %vx
dy(3)=-M.*G.*xx.*r.^-3; %ax

%dY/dt
dy(2)=y(4); %vy
dy(4)=-M.*G.*yy.*r.^-3; %ay

%Init
x_0=1;
y_0=1;
vx_0=0;
vy_0=5;

% %ODEs
[T,Y] = ode45(@Twobody,[0 1000],[x_0 y_0 vx_0 vy_0]);

%Vectors
x=Y(:,1);
y=Y(:,2);

%Plot
plot(x,y)
xlabel('x');
ylabel('y');
title('y=f(x)');    