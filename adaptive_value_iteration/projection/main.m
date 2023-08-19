clc
clear all
close all

n = 2;

%% First example

T = eye(2);
barA = [
    1   1
   -1   0
];
barb = [
    1
    1
];
barC = [1, 0];
A = T * barA * T^-1;
b = T * barb;
C = barC * T^-1;
r = 1e00;
gamma = 1e02;
beta = 1e00;
delta = 1e-06;
astar = [2, 2];
sys_x0 = [1, 1];
epsilon = 1e-01;

opt = odeset('RelTol', 1e-06, 'AbsTol', 1e-06);
odefun = @(t, x) dynamics(t, x, A, b, C, r, gamma, beta, epsilon, astar, delta);
x0 = [sys_x0, zeros(1, n), rand(1, n) * 1e-03, rand(1, n) * 1e-03, ...
    zeros(1, 2 * n + n^2)];
tfinal = 3000;
[t, x] = ode45(odefun, [0 tfinal], x0, opt);

f1 = figure(1);
f1.Position = [1800 200 800 500];
fsize = 14;
p1 = subplot(4, 1, 1);
    plot(t, x(:, 1:n));
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$x$', 'interpreter', 'latex', 'fontsize', fsize);
l1 = legend('$x_1$', '$x_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p2 = subplot(4, 1, 2);
    plot(t, x(:, (2 * n + 1):(3 * n)) + A(:, 1)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-1.5, 1.5]);
    grid on;
    ylabel('$\tilde a$', 'interpreter', 'latex', 'fontsize', fsize);
l2 = legend('$\tilde a_1$', '$\tilde a_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p3 = subplot(4, 1, 3);
    plot(t, x(:, (3 * n + 1):(4 * n)) - b(:)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-1.5, 1.5]);
    grid on;
    ylabel('$\tilde b$', 'interpreter', 'latex', 'fontsize', fsize);
l3 = legend('$\tilde b_1$', '$\tilde b_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p4 = subplot(4, 1, 4);
    plot(t, x(:, 1:n) - x(:, (n + 1):(2 * n)));
    xlim([0, 100]);
    ylim([-1.5, 1.5]);
    grid on;
    ylabel('$\tilde x$', 'interpreter', 'latex', 'fontsize', fsize);
l4 = legend('$\tilde x_1$', '$\tilde x_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
    xlabel('t');
set(p4, 'position', [.1 .1 .7 .2])
set(p3, 'position', [.1 .3 .7 .2])
set(p2, 'position', [.1 .5 .7 .2])
set(p1, 'position', [.1 .7 .7 .2])
set(l1, 'position', [.85 .75 .1 .1])
set(l2, 'position', [.85 .55 .1 .1])
set(l3, 'position', [.85 .35 .1 .1])
set(l4, 'position', [.85 .15 .1 .1])
%print('2nd_order_proj.eps', '-depsc')

%% SECOND EXAMPLE

T = [0.7513, 0.5060; 0.2551, 0.6991];
A = T * barA * T^-1;
b = T * barb;
C = barC * T^-1;

odefun = @(t, x) dynamics(t, x, A, b, C, r, gamma, beta, epsilon, astar, delta);
[t, x] = ode45(odefun, [0 tfinal], x0, opt);

f2 = figure(2);
f2.Position = [1800 200 800 500];
fsize = 14;
p1 = subplot(6, 1, 1);
    plot(t, x(:, 1:n));
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$x$', 'interpreter', 'latex', 'fontsize', fsize);
    yticks([-2, -1, 0, 1, 2]);
l1 = legend('$x_1$', '$x_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p2 = subplot(6, 1, 2);
    plot(t, x(:, (2 * n + 1):(3 * n)) + barA(:, 1)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-1.5, 1.5]);
    grid on;
    ylabel('$\tilde a$', 'interpreter', 'latex', 'fontsize', fsize);
    yticks([-1, -0.5, 0, 0.5, 1]);
l2 = legend('$\tilde a_1$', '$\tilde a_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p3 = subplot(6, 1, 3);
    plot(t, x(:, (3 * n + 1):(4 * n)) - barb(:)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-1.5, 1.5]);
    grid on;
    ylabel('$\tilde b$', 'interpreter', 'latex', 'fontsize', fsize);
    yticks([-1, -0.5, 0, 0.5, 1]);
l3 = legend('$\tilde b_1$', '$\tilde b_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
P = T' * icare(A, b, C' * C, r^-1, 0, eye(n), 0) * T;
p4 = subplot(6, 1, 4);
    plot(t, x(:, ((6 * n + 1):(6 * n + n^2))) - P(:)');
    xlim([0, 100]);
    grid on;
    ylabel('$\tilde P$', 'interpreter', 'latex', 'fontsize', fsize);
p5 = subplot(6, 1, 5);
    plot(t, x(:, ((6 * n + 1):(6 * n + n^2))) - P(:)');
    grid on;
    xlim([0, 100]);
    ylim([-0.5, 0.5]);
p6 = subplot(6, 1, 6);
    ys = zeros(size(x, 1), 1);
    for i = 1:1:size(x, 1)
        ys(i) = C * x(i, 1:n)';
    end
    grid on;
    plot(t, x(:, n + 1) - ys);
    xlim([0, 100]);
    ylabel('$\tilde y$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('t');
    yticks([-0.8, -0.6, -0.4, -0.2, 0]);
set(p6, 'position', [.1 .08 .7 .18])
set(p5, 'position', [.4 .3 .3 .1])
set(p4, 'position', [.1 .26 .7 .18])
set(p3, 'position', [.1 .44 .7 .18])
set(p2, 'position', [.1 .62 .7 .18])
set(p1, 'position', [.1 .8 .7 .18])
%set(l1, 'position', [.85 .75 .1 .1])
%set(l2, 'position', [.85 .55 .1 .1])
%set(l3, 'position', [.85 .35 .1 .1])
%print('2nd_order_proj_2.eps', '-depsc')
