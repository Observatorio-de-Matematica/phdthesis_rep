clc
clear
close all

fsize = 17;

estps = csvread('rt_fivefreqs_estps.csv')';

bias = 0.5;
amps = [1.2, 0.7, 1.0, 1.3, 0.85];
puls = 2 * pi * [2, 3, 5, 7, 10];
phases = [0.06, -0.08, -0.11, 0.05, 0.07];

n = 7;
hpuls = estps(:, 1:n);
hphases = estps(:, (n + 1):(2 * n));
hamps = estps(:, (2 * n + 1):(3 * n));
hbias = estps(:, end);

f = figure(1);
f.Position = [1800 200 800 500];

colororder({'r', 'g', 'b', 'c', 'm', 'y', 'k'})

%p1 = subplot(411);
plot(hpuls, '*');
hold on; grid on;
xlim([0, 50])
plot(zeros(size(hpuls, 1), size(hpuls, 2)) + puls);

set(gca, 'xticklabel', []);
yticks([0, 1, 2, 3, 4]);
ylim([0, 70]);
legend('$\hat\omega_1$', '$\hat\omega_2$', '$\omega_1$', '$\omega_2$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');

p2 = subplot(412);
plot(hphases, '*');
hold on; grid on;
plot(zeros(size(hphases, 1), size(hphases, 2)) + phases);
set(gca, 'xticklabel', []);
yticks([-2, -1, 0, 1]);
ylim([-2.5, 1.5]);
legend('$\hat\varphi_1$', '$\hat\varphi_2$', '$\varphi_1$', '$\varphi_2$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');

p3 = subplot(413);
plot(hamps, '*');
hold on; grid on;
plot(zeros(size(hamps, 1), size(hamps, 2)) + amps);
set(gca, 'xticklabel', []);
yticks([0.5, 1]);
ylim([0, 1.5]);
legend('$\hat\alpha_1$', '$\hat\alpha_2$', '$\alpha_1$', '$\alpha_2$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');

p4 = subplot(414);
plot(hbias, '*');
hold on; grid on;
plot(zeros(size(hbias, 1), 1) + bias, 'r');
xlabel('Training iteration', 'fontsize', fsize);
ylim([1, 2.5]);
yticks([1, 1.5, 2]);
legend('$\hat\alpha_0$', '$\alpha_0$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');

set(p4, 'position', [.075 .1 .8 .2])
set(p3, 'position', [.075 .3 .8 .2])
set(p2, 'position', [.075 .5 .8 .2])
set(p1, 'position', [.075 .7 .8 .2])

print('realtime_estps.eps', '-depsc')
