clc
clear

addpath("..")

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

eps = 4e-01; M = 1e01; tau = 1e00; betaQ = 1e02; r0 = 3e01; q0 = 1e00;
odefun = @(t, xtot) forgetting_least_squares_dynamics(t, xtot, eps, k, ...
    lambda, M, 0, 0, tau, betaQ, r0);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda))]';
tf = 200; [t1, xtot1] = ode45(odefun, [0 tf], xtot0);

ll = length(lambda);
figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on;
subplot(212); plot(t1, xtot1(:, (10 + ll^2):end) - lambda');
grid on;

save('forgetting_t.mat', 't1')
save('forgetting_xtot.mat', 'xtot1')
