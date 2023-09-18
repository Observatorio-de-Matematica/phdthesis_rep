clc
clear

rng(1)
opt = odeset('RelTol', 1e-06, 'AbsTol', 1e-06);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

eps = 1e-01; gamma = 1e02; M = 1e01; tau = 1e00; L = 0; eta = 1e-01;
odefun = @(t, xtot) integral_grad_dynamics(t, xtot, gamma, eps, k, lambda, ...
    M, L, 0, 0, 0, tau, eta);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), zeros(1, length(lambda)), ...
    zeros(1, length(lambda)), zeros(1, length(lambda))];
tf = 300; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);

figure(1);
ll = length(lambda);
subplot(321); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); ylim([-10, 10]);
subplot(322); plot(t1, xtot1(:, 10:(10 + ll - 1)));
subplot(323); plot(t1, xtot1(:, 10:(10 + ll - 1)) * 0 + lambda');
subplot(324); plot(t1, xtot1(:, 10:(10 + ll - 1)) - lambda'); grid on;
subplot(325); plot(t1, xtot1(:, (10 + ll):(10 + 2 * ll)));
subplot(326); plot(t1, xtot1(:, (10 + 2 * ll):end));

%eps = 1e-02; gamma = 1e06; M = 1e03; tau = 1e-02; L = 15;
%alpha = randn(L, length(x0)); beta = randn(L, length(x0));
%gam = ones(L, length(x0)); xtot0 = [x0, zeros(1, 3), zeros(1, 3), randn(1, L)];
%odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, L, ...
%    alpha, beta, gam, tau);
%tf = 1000; [t2, xtot2] = ode45(odefun, [0 tf], xtot0, opt);
%
%figure(2);
%subplot(311); plot(t2, xtot2(:, 1:3) - xtot2(:, 4:6)); ylim([-1, 1] * 0.5);
%subplot(312); plot(t2, xtot2(:, 1:3) - xtot2(:, 7:9)); ylim([-1, 1] * 0.5);
%subplot(313); plot(t2, xtot2(:, 10:end));
