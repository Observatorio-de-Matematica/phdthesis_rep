clc
clear
close all

fsize = 17;

estps = csvread('fq1_estps.csv');
fq1_hy = csvread('fq1_hy.csv');
fq1_y = csvread('fq1_y.csv');
noise_samples = csvread('fq1_noise.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

hold on; grid on;
plot(tt, fq1_y + noise_samples, 'b');
plot(tt, fq1_y + noise_samples - fq1_hy, 'k');
plot(tt, noise_samples, 'g');
xlabel('t', 'fontsize', fsize);
legend('$y(t)$', '$y(t)-\chi_1(t)$', '$w(t)$', 'fontsize', fsize - 5, ...
    'interpreter', 'latex', 'location', 'northwest');

print('fq1_outerr.eps', '-depsc')
