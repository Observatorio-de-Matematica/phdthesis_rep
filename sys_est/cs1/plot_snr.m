clc
clear
close all

fsize = 17;

noise_samples = csvread('cs1_noise.csv');
cs1_y = csvread('cs1_y.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

hold on; grid on;
plot(tt, cs1_y + noise_samples);
plot(tt, noise_samples);
xlabel('t', 'fontsize', fsize);
legend('$y(t)$', '$w(t)$', 'fontsize', fsize - 5, 'interpreter', 'latex');

print('cs1_meas_output.eps', '-depsc')
