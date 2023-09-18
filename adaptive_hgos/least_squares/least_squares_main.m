%COVARIANCE RESETTING
clc
clear

rng(1)
opt = odeset('RelTol', 1e-5, 'AbsTol', 1e-5, 'Events', @least_squares_event);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 2e-02;
eps = 1e-01; M = 1e01; tau = 1e-01; L = 0; q0 = 1e02;
odefun = @(t, xtot) least_squares_dynamics(t, xtot, eps, k, lambda, ...
    M, L, 0, 0, tau, q0, nn);
Q0 = q0 * eye(length(lambda));
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, length(lambda))]';
tf = 300; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);
tfs = t1(end);
ll = length(lambda);
while tfs < tf
    tfs = t1(end);
    if tfs >= tf
        break
    end

    xtot0 = xtot1(end, :);
    xtot0(10:(10 + ll^2 - 1)) = Q0(:);
    [tmpt, tmpxtot] = ode45(odefun, [tfs tf], xtot0, opt);

    xtot1 = [xtot1; tmpxtot];
    t1 = [t1; tmpt];

    disp(tfs)
end

figure(4);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); ylim([-2, 2]);
subplot(212); plot(t1, xtot1(:, (10 + ll^2):end) - lambda'); ylim([-1, 2]);
grid on

return

save('res/least_t1.mat', 't1')
save('res/least_xtot1.mat', 'xtot1')

clc
clear

rng(1)
opt = odeset('RelTol', 1e-5, 'AbsTol', 1e-5, 'Events', @least_squares_event);

k = [2, 2, 1];
A = [-k' eye(3, 2)];
[phi, x0, lambda] = get_sys_info(zeros(3));

nn = 0 * 2e-02;
eps = 1e-01; M = 1e03; tau = 1e01; L = 3; q0 = 1e03;
alpha = randn(length(x0), L); beta = randn(length(x0), L);
odefun = @(t, xtot) least_squares_dynamics(t, xtot, eps, k, lambda, ...
    M, L, alpha, beta, tau, q0, nn);
Q0 = q0 * eye(L);
xtot0 = [x0, zeros(1, 3), zeros(1, 3), Q0(:)', zeros(1, L)]';
tf = 20000; [t1, xtot1] = ode45(odefun, [0 tf], xtot0, opt);
tfs = t1(end);
ll = L;
while tfs < tf
    tfs = t1(end);
    if tfs >= tf
        break
    end

    xtot0 = xtot1(end, :);
    xtot0(10:(10 + ll^2 - 1)) = Q0(:);
    [tmpt, tmpxtot] = ode45(odefun, [tfs tf], xtot0, opt);

    xtot1 = [xtot1; tmpxtot];
    t1 = [t1; tmpt];

    disp(tfs)
end

figure(4);
subplot(211); plot(t1, xtot1(:, 1:3) - xtot1(:, 4:6)); ylim([-5, 5]);
subplot(212); plot(t1, xtot1(:, (10 + ll^2):end));
grid on

save('res/least_t2.mat', 't1')
save('res/least_xtot2.mat', 'xtot1')
