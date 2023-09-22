clc
clear

addpath("..")

rng(1)

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda, phi0, z0] = get_sys_info(zeros(3));

eps = 3e-01; M = 1e01; tau = 1e-03; q0 = 1e02;
odefun = @(t, xtot) least_squares_dynamics(t, xtot, eps, k, lambda, ...
    M, 0, 0, tau, q0);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda))]';
tf = 200; [t1, xtot1] = ode45(odefun, [0 tf], xtot0);
tfs = t1(end);
ll = length(lambda);
while tfs < tf
    tfs = t1(end);
    if tfs >= tf
        break
    end

    xtot0 = xtot1(end, :);
    xtot0(10:(10 + ll^2 - 1)) = Q0(:);
    [tmpt, tmpxtot] = ode45(odefun, [tfs tf], xtot0);

    xtot1 = [xtot1; tmpxtot];
    t1 = [t1; tmpt];

    disp(tfs)
end

figure(1);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); grid on
subplot(212); plot(t1, xtot1(:, (10 + ll^2):end) - lambda');
grid on

save('least_t.mat', 't1')
save('least_xtot.mat', 'xtot1')
