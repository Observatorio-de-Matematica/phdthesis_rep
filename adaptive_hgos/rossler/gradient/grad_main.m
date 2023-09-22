clc
clear

rng(1)
opt = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

eps = 3e-01; gamma = 1e02; M = 1e01; tau = 1e00;
odefun = @(t, xtot) grad_dynamics(t, xtot, gamma, eps, k, lambda, M, ...
    0, 0, tau);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), zeros(1, length(lambda)), z0]';
tf = 200; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);

figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on;
subplot(212); plot(t1, xtot1(:, 10:11) - lambda'); ylim([-1, 2]); grid on;

save('gradient_t.mat', 't1')
save('gradient_xtot.mat', 'xtot1')

hz = get_x(xtot1(:, 4:6));
figure(2); grid on
plot(t1, xtot1(:, 12:end) - hz);

save('gradient_hz.mat', 'hz')
