clc
clear
close all

fsize = 17;

estps = csvread('rt_fivefreqs_estps.csv')';

puls = 2 * pi * [2, 3, 5, 7, 10];

fft_hpuls = csvread('rt_fivefreqs_fft_hpuls.csv');
n = 7;
hpuls = estps(:, 1:n);
hpuls = [hpuls(:, 6) hpuls(:, 3) hpuls(:, 5) hpuls(:, 7) hpuls(:, 4)];
fft_hpuls = [fft_hpuls(6) fft_hpuls(3) fft_hpuls(5) fft_hpuls(7) fft_hpuls(4)];

f = figure(1);
f.Position = [1800 200 800 500];
colororder({'r', 'g', 'b', 'c', 'm'})

plot(0:size(hpuls, 1), [fft_hpuls; hpuls], '--');
grid on;
hold on;
plot(0:size(hpuls, 1), zeros(size(hpuls, 1) + 1, size(hpuls, 2)) + puls);
xlabel('Training iteration', 'fontsize', fsize);
legend('$\hat\omega_1$', '$\hat\omega_2$', '$\hat\omega_3$', ...
    '$\hat\omega_4$', '$\hat\omega_5$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
xlim([0, size(hpuls, 1) + 1]);

print('rt_5freqs_puls.eps', '-depsc')
