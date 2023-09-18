clc
clear

rng(1)
opt = odeset('RelTol', 1e-5, 'AbsTol', 1e-5);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 2e-02;
eps = 1e-01; gamma = 1e03; M = 1e01; tau = 1e00; L = 0;
%with m^2...
%eps = 1e-01; gamma = 1e04; M = 1e01; tau = 1e00; L = 0;
odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, L, ...
    0, 0, tau, nn);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), zeros(1, length(lambda))]';
tf = 300; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);

figure(3);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on; %ylim([-2, 2]);
subplot(212); plot(t1, xtot1(:, 10:end) - lambda'); ylim([-1, 2]); grid on;

save('res/grad_mod_t1.mat', 't1')
save('res/grad_mod_xtot1.mat', 'xtot1')

clc
clear

rng(1)
opt = odeset('RelTol', 1e-5, 'AbsTol', 1e-5);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 1e-02;
eps = 1e-01; gamma = 1e03; M = 1e03; tau = 1e00; L = 3;
alpha = randn(length(x0), L); beta = randn(length(x0), L);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), randn(1, L)]';
odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, L, ...
    alpha, beta, tau, nn);
tf = 20000; [t2, xtot2] = ode45(odefun, [0 tf], xtot0, opt);

figure(3);
val = 5;
subplot(311); plot(t2, xtot2(:, 1:3) - xtot2(:, 4:6)); ylim([-1, 1] * val);
subplot(312); plot(t2, xtot2(:, 1:3) - xtot2(:, 7:9)); ylim([-1, 1] * val);
subplot(313); plot(t2, xtot2(:, 10:end));

save('res/grad_mod_t2.mat', 't2')
save('res/grad_mod_xtot2.mat', 'xtot2')
