clc
clear all
close all

n = 2;

%% FIRST EXAMPLE

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

opt = odeset('RelTol', 1e-06, 'AbsTol', 1e-06);
x0 = [sys_x0, zeros(1, n), zeros(1, 2 * n), zeros(1, 2 * n)];
Ts = 1e-01;
K = 3000 / Ts;
x = zeros(K, length(x0));
t = zeros(K, 1);
ak = astar';
bk = b;
Pks = zeros(K, n * n);

ovrC = eye(n, 1)';
hA = [-ak, eye(n, n - 1)];
[Pk, tmpK, tmpL] = icare(hA, bk, ovrC' * ovrC, r^-1, 0, eye(n), 0);
for k = 1:1:K
    odefun = @(t, x) dynamics(t, x, A, b, C, r, gamma, ...
        beta, astar, delta, ak, bk, Pk);
    [tmp_t, tmp_x] = ode45(odefun, [(k - 1) * Ts, k * Ts], x0, opt);
    t(k) = tmp_t(end);
    x(k, :) = tmp_x(end, :);
    x0 = x(k, :);

    a = x(k, (2 * n + 1):(3 * n))';
    bvec = x(k, (3 * n + 1):(4 * n))';
    h = get_h(n, a, bvec);
    if h >= delta
        ak = a;
        bk = bvec;
    end

    hA = [-ak, eye(n, n - 1)];
    [Pk, tmpK, tmpL] = icare(hA, bk, ovrC' * ovrC, r^-1, 0, eye(n), 0);
    Pks(k, :) = Pk(:)';
end

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
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$\tilde a_k$', 'interpreter', 'latex', 'fontsize', fsize);
l2 = legend('$\tilde a_{k,1}$', '$\tilde a_{k,2}$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p3 = subplot(4, 1, 3);
    plot(t, x(:, (3 * n + 1):(4 * n)) - b(:)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$\tilde b_k$', 'interpreter', 'latex', 'fontsize', fsize);
l3 = legend('$\tilde b_{k,1}$', '$\tilde b_{k,2}$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p4 = subplot(4, 1, 4);
    plot(t, x(:, 1:n) - x(:, (n + 1):(2 * n)));
    xlim([0, 100]);
    ylim([-4, 4]);
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
%print('2nd_order_hyb.eps', '-depsc')

%% SECOND EXAMPLE

T = [0.7513, 0.5060; 0.2551, 0.6991];
A = T * barA * T^-1;
b = T * barb;
C = barC * T^-1;

x = zeros(K, length(x0));
t = zeros(K, 1);
ak = astar';
bk = b;
Pks = zeros(K, n * n);

ovrC = eye(n, 1)';
hA = [-ak, eye(n, n - 1)];
[Pk, tmpK, tmpL] = icare(hA, bk, ovrC' * ovrC, r^-1, 0, eye(n), 0);
for k = 1:1:K
    odefun = @(t, x) dynamics(t, x, A, b, C, r, gamma, ...
        beta, astar, delta, ak, bk, Pk);
    [tmp_t, tmp_x] = ode45(odefun, [(k - 1) * Ts, k * Ts], x0, opt);
    t(k) = tmp_t(end);
    x(k, :) = tmp_x(end, :);
    x0 = x(k, :);

    a = x(k, (2 * n + 1):(3 * n))';
    bvec = x(k, (3 * n + 1):(4 * n))';
    h = get_h(n, a, bvec);
    if h >= delta
        ak = a;
        bk = bvec;
    end

    hA = [-ak, eye(n, n - 1)];
    [Pk, tmpK, tmpL] = icare(hA, bk, ovrC' * ovrC, r^-1, 0, eye(n), 0);
    Pks(k, :) = Pk(:)';
end

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
l1 = legend('$x_1$', '$x_2$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p2 = subplot(6, 1, 2);
    plot(t, x(:, (2 * n + 1):(3 * n)) + barA(:, 1)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$\tilde a_k$', 'interpreter', 'latex', 'fontsize', fsize);
l2 = legend('$\tilde a_{k,1}$', '$\tilde a_{k,2}$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
p3 = subplot(6, 1, 3);
    plot(t, x(:, (3 * n + 1):(4 * n)) - barb(:)');
    xlim([0, 100]);
    set(gca, 'xticklabel', []);
    ylim([-2.5, 2.5]);
    grid on;
    ylabel('$\tilde b_k$', 'interpreter', 'latex', 'fontsize', fsize);
l3 = legend('$\tilde b_{k,1}$', '$\tilde b_{k,2}$', 'interpreter', 'latex', ...
        'Location', 'eastoutside', 'Fontsize', fsize);
P = T' * icare(A, b, C' * C, r^-1, 0, eye(n), 0) * T;
p4 = subplot(6, 1, 4);
    plot(t, Pks - P(:)');
    xlim([0, 100]);
    grid on;
    ylabel('$\check P-\bar P$', 'interpreter', 'latex', 'fontsize', fsize);
p5 = subplot(6, 1, 5);
    plot(t, Pks - P(:)');
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
    grid on;
    ylabel('$\tilde y$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('t');
set(p6, 'position', [.1 .08 .7 .18])
set(p5, 'position', [.4 .3 .3 .1])
set(p4, 'position', [.1 .26 .7 .18])
set(p3, 'position', [.1 .44 .7 .18])
set(p2, 'position', [.1 .62 .7 .18])
set(p1, 'position', [.1 .8 .7 .18])
%set(l1, 'position', [.85 .75 .1 .1])
%set(l2, 'position', [.85 .55 .1 .1])
%set(l3, 'position', [.85 .35 .1 .1])
%print('2nd_order_hyb_2.eps', '-depsc')
