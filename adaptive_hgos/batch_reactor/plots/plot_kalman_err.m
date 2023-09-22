clc
clear
close all

figure('Renderer', 'painters')

x1 = load('ekf_batchreactor_x.mat'); x1 = x1.x;
hx1 = load('ekf_batchreactor_hx.mat'); hx1 = hx1.hx;
t1 = load('ekf_batchreactor_t.mat'); t1 = t1.t;
x2 = load('ukf_batchreactor_x.mat'); x2 = x2.x2;
hx2 = load('ukf_batchreactor_hx.mat'); hx2 = hx2.hx2;
t2 = load('ukf_batchreactor_t.mat'); t2 = t2.t2;

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(211);
plot(t1, x1 - hx1);
grid on;
set(gca, 'xticklabel', []);
%yticks([-1, -0.5, 0, 0.5, 1])
%ylim([-1, 1] * 0.6)
ylabel('$\tilde z_{\mathrm{EKF}}(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(212);
plot(t2, x2 - hx2);
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
yticks([-4, -3, -2, -1, 0, 1, 2])
%ylim([-1, 1] * 0.6)
ylabel('$\tilde z_{\mathrm{EKF}}(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

set(p2, 'position', [.1 .1 .8 .4])
set(p1, 'position', [.1 .5 .8 .4])

print('batchreactor_kalman.eps', '-depsc')
