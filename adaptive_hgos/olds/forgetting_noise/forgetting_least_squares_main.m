%FORGETTING FACTOR
clc
clear

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));
tf = 250;
tdist = 0:1e-01:tf;
dist = 1e-02 * randn(1, length(tdist));

eps = 0.6; M = 1e01; tau = 1; betaQ = 0.1; r0 = 50; q0 = r0 / 10;
odefun = @(t, xtot) forgetting_least_squares_dynamics(t, xtot, eps, k, ...
    lambda, M, 0, 0, tau, betaQ, r0, tdist, dist);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda)), z0]';
[t1, xtot1] = ode45(odefun, [0 tf], xtot0);

ll = length(lambda);
figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on;
ylim([-0.1, 0.1])
subplot(212); plot(t1, xtot1(:, (10 + ll^2):(10 + ll^2 + 1)) - lambda');
ylim([-0.6, 0.6])
grid on;

save('noise_forgetting_t.mat', 't1')
save('noise_forgetting_xtot.mat', 'xtot1')
