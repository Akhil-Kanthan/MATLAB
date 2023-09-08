x1 = 0;
x2 = 0;
x3 = 0;
for i=1:1:25;
    i
    n_x1 = (-2+2*x3)/(2)
    n_x2 = (4-x1)/(2)
    n_x3 = (x1+x2)/(2)
    x1=n_x1
    x2=n_x2
    x3=n_x3

    disp("--New Iteration--")
end