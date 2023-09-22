clc
clear
close all

[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

xtot_gr = load('noise_gradient_xtot.mat'); xtot = xtot_gr.xtot1;
t1 = load('noise_gradient_t.mat'); t = t1.t1;
hz = load('noise_gradient_hz.mat'); hz = hz.hz;

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(211);
plot(t, xtot(:, 1:3) - xtot(:, 4:6));
grid on;
set(gca, 'xticklabel', []);
%yticks([-2, -1, 0, 1])
ylim([-1, 1] * 0.6)
ylabel('$\tilde x(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(212);
plot(t, xtot(:, 10:11) - lambda');
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
%yticks([-1, 0, 1])
ylim([-1, 1] * 0.6)
ylabel('$\tilde\lambda(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

set(p2, 'position', [.1 .1 .8 .4])
set(p1, 'position', [.1 .5 .8 .4])

print('noise_rossler_grad.eps', '-depsc')
