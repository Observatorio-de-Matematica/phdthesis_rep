%FORGETTING FACTOR
clc
clear

rng(1)
opt = odeset('RelTol', 1e-5, 'AbsTol', 1e-5);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 2e-02;
eps = 3e-01; M = 1e01; tau = 1e00; L = 0; betaQ = 1e01; r0 = 1e02; q0 = 1e00;
odefun = @(t, xtot) forgetting_least_squares_dynamics(t, xtot, eps, k, ...
    lambda, M, L, 0, 0, tau, betaQ, r0, nn);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda))]';
tf = 300; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);

ll = length(lambda);
figure(2);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on; ylim([-2, 2]);
subplot(212); plot(t1, xtot1(:, (10 + ll^2):end) - lambda'); grid on;
ylim([-1, 2]);

return

save('res/forg_t1.mat', 't1')
save('res/forg_xtot1.mat', 'xtot1')

clc
clear

rng(1)
opt = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 1e-02;
eps = 1e-01; M = 1e03; tau = 1e00; L = 3; betaQ = 1e02; r0 = 1e03; q0 = 1e00;
alpha = randn(length(x0), L); beta = randn(length(x0), L);
Q0 = q0 * eye(L);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', randn(1, L)];
odefun = @(t, xtot) forgetting_least_squares_dynamics(t, xtot, eps, k, ...
    lambda, M, L, alpha, beta, tau, betaQ, r0, nn);
tf = 20000; [t2, xtot2] = ode45(odefun, [0 tf], xtot0, opt);

figure(2);
val = 5;
subplot(311); plot(t2, xtot2(:, 1:3) - xtot2(:, 4:6)); ylim([-1, 1] * val);
subplot(312); plot(t2, xtot2(:, 1:3) - xtot2(:, 7:9)); ylim([-1, 1] * val);
subplot(313); plot(t2, xtot2(:, (10 + L^2):end));

save('res/forg_t2.mat', 't2')
save('res/forg_xtot2.mat', 'xtot2')
