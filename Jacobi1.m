 x1 = 0;
x2 = 0;
x3 = 0;
for i=1:1:25;
    i
    newx1 = (-2+2*x3)/(2)
    newx2 = (4-x1)/(2)
    newx3 = (x1+x2)/(2)
    x1=newx1
    x2=newx2
    x3=newx3

    disp("--New Iteration--")
end