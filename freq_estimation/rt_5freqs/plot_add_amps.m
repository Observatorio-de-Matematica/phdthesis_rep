clc
clear
close all

fsize = 17;

estps = csvread('rt_fivefreqs_estps.csv')';
n = 7;
hamps = estps(:, (2 * n + 1):(3 * n));
fft_hamps = csvread('rt_fivefreqs_fft_hamps.csv');

f = figure(1);
f.Position = [1800 200 800 500];

plot(0:size(hamps, 1), [fft_hamps(1:2)'; hamps(:, 1:2)], '*');
grid on;
xlabel('Training iteration', 'fontsize', fsize);
legend('$\hat\alpha_6$', '$\hat\alpha_7$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'northeast');

print('rt_5freqs_addamps.eps', '-depsc')
