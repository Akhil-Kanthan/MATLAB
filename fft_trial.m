data = importdata("C:\Users\akhil\OneDrive\Desktop\small400.csv");

pixel = data(:, 1) ;
inten = data(:,2);
position = pixel*7e-6;
lambda = 632.8e-9;
distance = 400e-3;
minima_positions = [833,1603,2338,3157,3948,4774,5551,6335];

d_1= zeros(1, length(minima_positions)-1);
slitdist = zeros(1,length(minima_positions)-1);

for i = 1:length(minima_positions)-1
    d_1(i) = minima_positions(i+1) - minima_positions(i);
    slitdist(i) = lambda * distance / (d_1(i)*7e-6);
end

avg = mean(slitdist);
err = std(slitdist);

disp(['Average of d :', num2str(avg)]);
disp(['Error of d :', num2str(err)]);

plot(position, inten);
xlabel('Position (m)');
ylabel('Intensity');
title('Measured Intensity Distribution');

% Calculate the corresponding spatial frequencies
pixel_size = 7e-3; 
spatial_frequency = (0:length(inten)-1) / (pixel_size);

fft_intensity=fft(inten);
absfft=abs(fft_intensity(1:100));
figure(2)
plot(absfft)
title("FFT ")
ylabel("Intensity")


% % Perform FFT on the intensity data
% intensity_fft = max(abs(fft(inten(5:100))));
% IOMV = find(abs(fft(inten))==max(abs(fft(inten(5:100)))));
% FI = IOMV(1);

maxvalue=max(absfft(5:100));
IndexOfMaxValue = find(absfft==max(absfft(5:100)));
FirstIndex=IndexOfMaxValue(1);
da_l = 21e-3; % diode array length [m]
dia_fft=FirstIndex*lambda*distance/da_l; % object diameter


% Find negative peaks
% [~, minima_positions] = findpeaks(intensity_fft); 
% d1 = 1/spatial_frequency(minima_positions(1));

% Object diameter calculation
% od = FI*lambda * distance/ 21e-3;


% fprintf('Average Diameter: %f mm\n', average_d);
% fprintf('Error: %f mm\n', error_d);
 fprintf('Object Diameter : %f m\n', dia_fft);
% fprintf('Average Diameter: %.4f mm\n', average_d);
% fprintf('Error: %.4f mm\n', error_d);
% fprintf('Final Object Diameter: %.4f mm\n', d(end));




% % Plot the measured and calculated intensity distributions
% figure;
% hold on;
% plot(position, inten, 'b', 'LineWidth', 1.5);
% plot(spatial_frequency(1:100),intensity_fft(1:100), 'r', 'LineWidth', 1.5);
% hold off;
% xlabel('Position (m) / Spatial Frequency (1/m)');
% ylabel('Intensity');
% legend('Measured Intensity', 'Calculated Intensity (FFT)');
% title('Measured and Calculated Intensity Distributions');