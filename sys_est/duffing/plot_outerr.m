clc
clear
close all

fsize = 17;

estps = csvread('duffing_estps.csv');
duffing_hy = csvread('duffing_hy.csv');
duffing_y = csvread('duffing_y.csv');
noise_samples = csvread('duffing_noise.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

hold on; grid on;
plot(tt, duffing_y + noise_samples, 'b');
plot(tt, duffing_y + noise_samples - duffing_hy, 'k');
plot(tt, noise_samples, 'g');
xlabel('t', 'fontsize', fsize);
legend('$y(t)$', '$y(t)-\chi_1(t)$', '$w(t)$', 'fontsize', fsize - 5, ...
    'interpreter', 'latex', 'location', 'southeast');

print('duffing_outerr.eps', '-depsc')

estps(:, end)
