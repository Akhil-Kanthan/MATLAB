x = [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7]
y1 = [21.5 33.4 48.1 64.3 76.1 92.8 107.6 123.1]
y2 = [21.5 31.2 43.4 60.9 75.7 87.4 102.2 116.1]
y3 = [21.5 35.1 49.6 65.7 81.3 93.6 108.3 123.4]
title ('Uncompensated State Measurements')
xlabel ('Pressure')
ylabel ('Voltage')

hold on
plot (x,y1,'k--')
plot (x,y2,'b-')
plot (x,y3,'b--')

legend('Ambient temperature voltage','Heating Voltage','Cooling Voltage')