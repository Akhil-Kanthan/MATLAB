data = load("C:\Users\akhil\OneDrive\Desktop\small400.csv");
pixel = data(:,1);
inten = data(:,2);
position = pixel*7e-6;
lambda = 632.8e-9;
L = 635e-9;


plot(position,inten)
xlabel("Position")
ylabel("Intensity")
title("Diffraction pattern of small wire")

fft_inten = fft(inten);
fft = abs(fft_inten(1:100));


plot(fft)
title("Performing FFT")
