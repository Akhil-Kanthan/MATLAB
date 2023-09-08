data = importdata("C:\Users\akhil\OneDrive\Desktop\small400.csv");

% Convert pixel number to mm
position = data(:, 1) * 7e-3;
inten = data(:,2);
plot(position, inten);
xlabel('Position (mm)');
ylabel('Intensity');
title('Measured Intensity Distribution');

% Perform FFT on the intensity data
intensity_fft = abs(fft(inten));

% Find negative peaks
[~, minima_positions] = islocalmax(-intensity_fft(5:100)); 
distance = (data(5:end-4));  % Extract distance from the filename
d = lambda * distance ./ minima_positions(1);  % Object diameter calculation
average_d = mean(d);
error_d = std(d);
% fprintf('Average Diameter: %f mm\n', average_d);
% fprintf('Error: %f mm\n', error_d);
 fprintf('Object Diameter %d: %f mm\n', d);
% fprintf('Average Diameter: %.4f mm\n', average_d);
% fprintf('Error: %.4f mm\n', error_d);
% fprintf('Final Object Diameter: %.4f mm\n', d(end));



% Calculate the corresponding spatial frequencies
pixel_size = 7e-3; 
spatial_frequency = (0:length(inten)-1) / (pixel_size);

% Plot the measured and calculated intensity distributions
figure;
hold on;
plot(position, inten, 'b', 'LineWidth', 1.5);
plot(intensity_fft(1:100), 'r', 'LineWidth', 1.5);
hold off;
xlabel('Position (mm) / Spatial Frequency (1/mm)');
ylabel('Intensity');
legend('Measured Intensity', 'Calculated Intensity (FFT)');
title('Measured and Calculated Intensity Distributions');
