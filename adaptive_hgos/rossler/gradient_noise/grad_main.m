clc
clear

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));
tf = 250;
tdist = 0:1e-01:tf;
dist = 1e-02 * randn(1, length(tdist));

eps = 0.85; gamma = 1.2; M = 1e01; tau = 0;
odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, ...
    0, 0, tau, tdist, dist);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), zeros(1, length(lambda)), z0]';
[t1, xtot1] = ode45(odefun, [0 tf], xtot0);

figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on;
ylim([-0.4, 0.4])
subplot(212); plot(t1, xtot1(:, 10:11) - lambda'); ylim([-1, 2]); grid on;
ylim([-0.6, 0.6])

save('noise_gradient_t.mat', 't1')
save('noise_gradient_xtot.mat', 'xtot1')
