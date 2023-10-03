clc
clear
close all

fsize = 17;

gain_vals = csvread('lor_gain.csv');
hx = csvread('lor_hx.csv');
x = csvread('lor_x.csv');

tt = 0:0.01:(50 - 0.01);
f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(311);
grid on; hold on; box on
plot(tt, x(:, 1));
plot(tt, hx(:, 1));
yticks([-2, -1, 0, 1, 2]);
set(gca, 'xticklabel', []);
xlabel('t', 'fontsize', fsize);
l1 = legend('$x_1(t)$', '$\hat x_1(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
grid on;

p2 = subplot(312);
grid on; hold on; box on
plot(tt, x(:, 2));
plot(tt, hx(:, 2));
xlabel('t', 'fontsize', fsize);
l2 = legend('$x_2(t)$', '$\hat x_2(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
yticks([-2, 0, 2]);
set(gca, 'xticklabel', []);

p3 = subplot(313);
grid on; hold on; box on
plot(tt, x(:, 3));
plot(tt, hx(:, 3));
l3 = legend('$x_3(t)$', '$\hat x_3(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
yticks([-2, 0, 2]);
xlabel('t', 'fontsize', fsize);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])
set(l1, 'position', [.92 .75    .025 .05])
set(l2, 'position', [.92 .45    .025 .05])
set(l3, 'position', [.92 .19    .025 .05])

print('lor_hgodesign.eps', '-depsc')
