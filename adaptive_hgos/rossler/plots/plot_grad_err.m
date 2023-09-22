clc
clear
close all

[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

xtot_gr = load('gradient_xtot.mat'); xtot = xtot_gr.xtot1;
t1 = load('gradient_t.mat'); t = t1.t1;
hz = load('gradient_hz.mat'); hz = hz.hz;

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(311);
plot(t, xtot(:, 1:3) - xtot(:, 4:6));
grid on;
set(gca, 'xticklabel', []);
yticks([-2, -1, 0, 1])
ylabel('$\tilde x(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(312);
plot(t, xtot(:, 10:11) - lambda');
grid on;
set(gca, 'xticklabel', []);
yticks([-1, 0, 1])
ylabel('$\tilde\lambda(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p3 = subplot(313);
plot(t, xtot(:, 12:end) - hz);
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
yticks([-5, 0, 5, 10])
ylabel('$\tilde z(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])

print('rossler_grad.eps', '-depsc')
