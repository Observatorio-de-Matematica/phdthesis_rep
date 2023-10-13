clc
clear
close all

fsize = 17;

estps = csvread('cs1_estps.csv');
cs1_hy = csvread('cs1_hy.csv');
cs1_y = csvread('cs1_y.csv');
noise_samples = csvread('cs1_noise.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

hold on; grid on;
plot(tt, cs1_y + noise_samples, 'b');
plot(tt, cs1_y + noise_samples - cs1_hy, 'k');
plot(tt, noise_samples, 'g');
xlabel('t', 'fontsize', fsize);
legend('$y(t)$', '$y(t)-\chi_1(t)$', '$w(t)$', 'fontsize', fsize - 5, ...
    'interpreter', 'latex', 'location', 'northeast');

print('cs1_outerr.eps', '-depsc')

estps(:, end)
