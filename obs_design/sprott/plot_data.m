clc
clear
close all

fsize = 17;

gain_vals = csvread('sprott_gain.csv');
hx = csvread('sprott_hx.csv')';
x = csvread('sprott_x.csv')';

tt = 0:0.01:(50 - 0.01);
f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(311);
grid on; hold on; box on
plot(tt, gain_vals);
yticks([5, 10, 15, 20, 25]);
set(gca, 'xticklabel', []);
xlabel('t', 'fontsize', fsize);
ylabel('$\mathrm{N}_1(t)$', 'interpreter', 'latex', 'fontsize', fsize);
grid on;

p2 = subplot(312);
grid on; hold on; box on
plot(tt, x);
xlabel('t', 'fontsize', fsize);
l1 = legend( ...
       '$x_1$', ...
       '$x_2$', ...
       '$x_3$', ...
       'fontsize', fsize - 5, 'interpreter', 'latex', ...
        'location', 'eastoutside');
yticks([-10, -5, 0, 5]);
set(gca, 'xticklabel', []);

p3 = subplot(313);
grid on; hold on; box on
plot(tt, x - hx);
yticks([-2, 0, 2, 4]);
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
l2 = legend( ...
       '$\tilde x_1$', ...
       '$\tilde x_2$', ...
       '$\tilde x_3$', ...
       'fontsize', fsize - 5, 'interpreter', 'latex', ...
        'location', 'eastoutside');

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])
set(l1, 'position', [.92 .45   .05 .1])
set(l2, 'position', [.92 .19    .05 .1])

print('sprott_hgodesign.eps', '-depsc')
