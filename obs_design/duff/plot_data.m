clc
clear
close all

fsize = 17;

gain_vals = csvread('duff_gain.csv');
hx = csvread('duff_hx.csv');
x = csvread('duff_x.csv');

tt = 0:0.01:(50 - 0.01);
f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(311);
plot(tt, gain_vals, 'b');
yticks([20, 30, 40]);
set(gca, 'xticklabel', []);
xlabel('t', 'fontsize', fsize);
ylabel('$\mathrm{N}_1(t)$', 'interpreter', 'latex', 'fontsize', fsize);
grid on;

p2 = subplot(312);
grid on; hold on; box on
plot(tt, x(:, 1), 'b');
plot(tt, x(:, 2), 'k');
xlabel('t', 'fontsize', fsize);
yticks([-2, 0, 2]);
set(gca, 'xticklabel', []);
l1 = legend( ...
       '$x_1$', ...
       '$x_2$', ...
       'fontsize', fsize - 5, 'interpreter', 'latex', ...
        'location', 'eastoutside');

p3 = subplot(313);
grid on; hold on; box on
tildex = x - hx;
plot(tt, tildex(:, 1), 'b');
plot(tt, tildex(:, 2), 'k');
yticks([-2, 0, 2, 4]);
xlabel('t', 'fontsize', fsize);
l2 = legend( ...
       '$\tilde x_1$', ...
       '$\tilde x_2$', ...
       'fontsize', fsize - 5, 'interpreter', 'latex', ...
        'location', 'eastoutside');

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])
set(l1, 'position', [.92 .45   .05 .1])
set(l2, 'position', [.92 .19    .05 .1])

print('duff_hgodesign.eps', '-depsc')
