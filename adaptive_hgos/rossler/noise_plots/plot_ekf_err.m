clc
clear
close all

figure('Renderer', 'painters')

[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));
ll = length(lambda);

x1 = load('ekf_x.mat'); x = x1.x;
x1 = load('ekf_hx.mat'); hx = x1.hx;
t1 = load('ekf_t.mat'); t = t1.t;
hl = load('ekf_hl.mat'); hl = hl.hlam;

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(211);
plot(t, x - hx);
grid on;
set(gca, 'xticklabel', []);
%yticks([-1, -0.5, 0, 0.5, 1])
ylim([-1, 1] * 0.6)
ylabel('$\tilde x(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(212);
plot(t, hl - abs(lambda)');
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
%yticks([-1, -0.5, 0, 0.5, 1])
ylim([-1, 1] * 0.6)
ylabel('$\tilde\lambda(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

set(p2, 'position', [.1 .1 .8 .4])
set(p1, 'position', [.1 .5 .8 .4])

print('noise_rossler_ekf.eps', '-depsc')
