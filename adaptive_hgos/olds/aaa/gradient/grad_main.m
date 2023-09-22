clc
clear

addpath("..")

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

eps = 1e-01; gamma = 1e03; M = 1e01; tau = 1e-01;
odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, ...
    0, 0, tau);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), zeros(1, length(lambda))]';
tf = 100; [t1, xtot1] = ode45(odefun, [0 tf], xtot0);

figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on;
subplot(212); plot(t1, xtot1(:, 10:end) - lambda'); ylim([-1, 2]); grid on;

save('gradient_t.mat', 't1')
save('gradient_xtot.mat', 'xtot1')
