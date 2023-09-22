clear all
close all
clc

rng(123)
n = 3;
m = 5;
lam = [0.5; 0.5];

a = 1/2;
b = 2;
k = 0;
Q = eye(5);
R = 1e-2 * eye(1);

Tf = 250;
tdist = 0:1e-1:Tf;
dist = 1e-02 * randn(1, length(tdist));

odefun = @(t, x) ukf_dynamics(t, tdist, dist, x, lam, a, b, k, R, Q);

x0 = [0.1; 0.3; 0];
hx0 = zeros(m, 1);
hP0 = eye(m);

tspan = [0, Tf];
[t, state] = ode45(odefun, tspan, [x0; hx0; hP0(:)]);

z = state(:, 1:n);
hx = state(:, (n + 1):(2 * n));
hlam = state(:, (2 * n + 1):(n + m));
P = state(:, (n + m + 1):end);
x = get_x(z);

figure(1);
p1 = subplot(2,1,1);
plot(t, hx - x, 'linewidth', 1)
p2 = subplot(2,1,2);
plot(t, hlam - lam', 'linewidth', 1)

save('ukf_t.mat', 't')
save('ukf_x.mat', 'x')
save('ukf_hx.mat', 'hx')
save('ukf_hl.mat', 'hlam')
