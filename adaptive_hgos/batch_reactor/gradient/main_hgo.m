clear all
close all
clc

rng(1)
eps = 0.3;
gamma = 30;
tau = 1;
M = 10;
mu = 10;
alpha = randn(3, 4);
beta = randn(3, 4);

Tf = 30;

n = 3;
Ae = [
    -2/eps, 1, 0; 
    -2/eps^2, 0, 1;
    -1/eps^3, 0, 0;
];
Be = -Ae(:,1);

odefun = @(t, x) hgo_dynamics(t, x, Ae, Be, gamma, M, mu, alpha, beta, tau);

z0 = [0.5; 0.05; 0];
hx0 = zeros(3,1);
hz0 = [0; 0; 4];
m = length(get_psi(hx0, alpha, beta));
hl0 = zeros(m, 1);

tspan = [0, Tf];
[t, state] = ode45(odefun, tspan, [z0; hx0; hl0; hz0]);

z = state(:, 1:n);
hx = state(:, (n + 1):(2 * n));
hlam = state(:, (2 * n + 1):(2 * n + m));
hz = state(:, (2 * n + m + 1):end);

x = get_x(z);
save('grad_batchreactor_t.mat', 't')
save('grad_batchreactor_hx.mat', 'hx')
save('grad_batchreactor_x.mat', 'x')
save('grad_batchreactor_hz.mat', 'hz')
save('grad_batchreactor_z.mat', 'z')
save('grad_batchreactor_hlam.mat', 'hlam')
