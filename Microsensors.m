x = [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7]
y1 = [21.31 33.10 45.60 64.20 78.60 92.80 107.60 122.50]
y2 = [22.20 33.10 47.10 62.80 79.10 92.80 107.80 121.90 ]
y3 = [21.28 32.90 46.10 64.40 78.40 92.50 107.10 122.40 ]
plot (x,y1)
title ('Compensated State Measurements')
xlabel ('Pressure')
ylabel ('Voltage')

hold on
plot (x,y1,'k--')
plot (x,y2,'b-')
plot (x,y3,'b--')

legend('Ambient temperature voltage','Heating Voltage','Cooling Voltage')