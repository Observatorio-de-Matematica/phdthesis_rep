clc
clear
close all

fsize = 17;

ts = 0.01;
tf = 50;
times = 0:ts:(tf - ts);

tildexi_hgo_eps005 = readtable('tildexi_hgo_eps005.csv');
tildexi_hgo_eps01 = readtable('tildexi_hgo_eps01.csv');
tildexi_hgo_eps025 = readtable('tildexi_hgo_eps025.csv');

f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(611); hold on; box on
plot(times, tildexi_hgo_eps005.Var1)
plot(times, tildexi_hgo_eps01.Var1)
plot(times, tildexi_hgo_eps025.Var1)
set(gca, 'xticklabel', []);
grid on;
yticks([-1, -0.5, 0, 0.5]);
ylabel('$\tilde\xi_1$', 'interpreter', 'latex', 'fontsize', fsize);
l1 = legend('$\varepsilon=0.005$', '$\varepsilon=0.01$', ...
    '$\varepsilon=0.025$', 'interpreter', 'latex', 'fontsize', fsize - 5);

p2 = subplot(612); hold on; box on
plot(times, tildexi_hgo_eps005.Var2)
plot(times, tildexi_hgo_eps01.Var2)
plot(times, tildexi_hgo_eps025.Var2)
set(gca, 'xticklabel', []);
grid on;
yticks([0 10 20 30]);
ylabel('$\tilde\xi_2$', 'interpreter', 'latex', 'fontsize', fsize);

p3 = subplot(613); hold on; box on
plot(times, tildexi_hgo_eps005.Var3)
plot(times, tildexi_hgo_eps01.Var3)
plot(times, tildexi_hgo_eps025.Var3)
grid on;
yticks([-200 0 200]);
ylabel('$\tilde\xi_3$', 'interpreter', 'latex', 'fontsize', fsize);
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);

p4 = subplot(614); hold on; box on
plot(times, tildexi_hgo_eps005.Var1)
plot(times, tildexi_hgo_eps01.Var1)
plot(times, tildexi_hgo_eps025.Var1)
set(gca, 'xticklabel', []);
grid on;
ylim(0.1 * [-1, 1]);

p5 = subplot(615); hold on; box on
plot(times, tildexi_hgo_eps005.Var2)
plot(times, tildexi_hgo_eps01.Var2)
plot(times, tildexi_hgo_eps025.Var2)
set(gca, 'xticklabel', []);
grid on;
ylim(1.5 * [-1, 1]);

p6 = subplot(616); hold on; box on
plot(times, tildexi_hgo_eps005.Var3)
plot(times, tildexi_hgo_eps01.Var3)
plot(times, tildexi_hgo_eps025.Var3)
set(gca, 'xticklabel', []);
grid on;
ylim(15 * [-1, 1]);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])
set(p4, 'position', [.4 .66   .3 .1])
set(p5, 'position', [.4 .45   .3 .1])
set(p6, 'position', [.4 .23   .3 .1])

set(l1, 'position', [.7429 .66 .1439 .124])

print('hgo_errs.eps', '-depsc')
