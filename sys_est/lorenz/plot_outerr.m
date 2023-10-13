clc
clear
close all

fsize = 17;

estps = csvread('lorenz_estps.csv');
lorenz_hy = csvread('lorenz_hy.csv');
lorenz_y = csvread('lorenz_y.csv');
noise_samples = csvread('lorenz_noise.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

hold on; grid on;
plot(tt, lorenz_y + noise_samples, 'b');
plot(tt, lorenz_y + noise_samples - lorenz_hy, 'k');
plot(tt, noise_samples, 'g');
xlabel('t', 'fontsize', fsize);
legend('$y(t)$', '$y(t)-\chi_1(t)$', '$w(t)$', 'fontsize', fsize - 5, ...
    'interpreter', 'latex', 'location', 'northeast');

print('lorenz_outerr.eps', '-depsc')

estps(:, end)
