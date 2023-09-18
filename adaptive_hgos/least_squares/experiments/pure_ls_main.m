clc
clear

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

eps = 1e-01; M = 1e01; tau = 1e02; L = 0; q0 = 1e02;
odefun = @(t, xtot) pure_ls_dynamics(t, xtot, eps, k, lambda, ...
    M, L, 0, 0, 0, tau, q0);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda))];
tf = 1500;
ll = length(lambda);
[t1, xtot1] = ode45(odefun, [0 tf], xtot0);

figure(1);
subplot(411); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); ylim([-10, 10]);
subplot(412); plot(t1, xtot1(:, (10 + ll^2):end) - lambda'); grid on
subplot(413); plot(t1, xtot1(:, (10 + ll^2):end));
subplot(414); plot(t1, xtot1(:, (10:(10 + ll^2 - 1))))

%eps = 1e-02; M = 1e03; tau = 1e-03; L = 5; q0 = 1e02; q1 = 1e00;
%alpha = randn(L, length(x0)); beta = randn(L, length(x0));
%gam = ones(L, length(x0));
%Q0 = q0 * eye(L);
%xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', randn(1, L)];
%odefun = @(t, xtot) least_squares_dynamics(t, xtot, eps, k, lambda, ...
%    M, L, alpha, beta, gam, tau, q0, q1);
%tf = 100; [t2, xtot2] = ode45(odefun, [0 tf], xtot0, opt);
%
%figure(2);
%subplot(411); plot(t2, xtot2(:, 1:3) - xtot2(:, 4:6)); ylim([-1, 1]);
%subplot(412); plot(t2, xtot2(:, 1:3) - xtot2(:, 7:9)); ylim([-1, 1]);
%subplot(413); plot(t2, xtot2(:, (10:(10 + L^2 - 1))))
%subplot(414); plot(t2, xtot2(:, (10 + L^2):end));
