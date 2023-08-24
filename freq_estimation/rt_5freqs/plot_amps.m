clc
clear
close all

fsize = 17;

estps = csvread('rt_fivefreqs_estps.csv')';

bias = 0.5;
amps = [1.2, 0.7, 1.0, 1.3, 0.85];

fft_hamps = csvread('rt_fivefreqs_fft_hamps.csv');
n = 5;
hamps = estps(:, (2 * n + 1):(3 * n));
hamps = [hamps(:, 4) hamps(:, 1) hamps(:, 3) hamps(:, 5) hamps(:, 2)];
fft_hamps = [fft_hamps(4) fft_hamps(1) fft_hamps(3) fft_hamps(5) fft_hamps(2)];

hbias = estps(:, end);
fft_hbias = csvread('rt_fivefreqs_fft_hbias.csv');

f = figure(1);
f.Position = [1800 200 800 500];
colororder({'r', 'g', 'b', 'c', 'm', 'k'})

%plot(0:size(hamps, 1), [fft_hbias fft_hamps; hbias hamps], '*');
%grid on;
%hold on;
%plot(0:size(hamps, 1), ...
%    zeros(size(hamps, 1) + 1, size(hamps, 2) + 1) + [bias amps]);

tmp1 = [fft_hbias fft_hamps; hbias hamps];
tmp2 = zeros(size(hamps, 1) + 1, size(hamps, 2) + 1) + [bias amps];
plot(0:size(hamps, 1), tmp2 - tmp1, '*');
grid on;

xlabel('Training iteration', 'fontsize', fsize);
%legend('$\hat\alpha_0$', '$\hat\alpha_1$', '$\hat\alpha_2$', ...
%    '$\hat\alpha_3$', '$\hat\alpha_4$', '$\hat\alpha_5$', ...
%    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
legend('$\alpha_0-\hat\alpha_0$', '$\alpha_1-\hat\alpha_1$', ...
    '$\alpha_2-\hat\alpha_2$', '$\alpha_3-\hat\alpha_3$', ...
    '$\alpha_4-\hat\alpha_4$', '$\alpha_5-\hat\alpha_5$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
xlim([0, size(hamps, 1) + 1]);

print('rt_5freqs_amps.eps', '-depsc')
