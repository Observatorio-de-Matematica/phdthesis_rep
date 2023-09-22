clear all
close all
clc

n = 3;

a = 1/2;
b = 2;
k = 1;
Q = eye(n);
R = eye(1);
iR = inv(R);

Tf = 30;

odefun = @(t,x) ekf_dynamics(x, Q, iR);
x0 = [0.5; 0.05; 0];
hx0 = [0; 0; 4];
hP0 = eye(n);
tspan = [0,Tf];
[t, state] = ode45(odefun, tspan, [x0; hx0; hP0(:)]);
x = state(:, 1: n);
y = (821/25)*sum(x,2);
hx = state(:, n + 1: 2*n);
P = state(:, 2*n:end);

odefun = @(t,x) ukf_dynamics(x, a, b, k, R, Q);
x0 = [0.5; 0.05; 0];
hx0 = [0; 0; 4];
hP0 = eye(n);
tspan = [0,Tf];
[t2, state] = ode45(odefun, tspan, [x0; hx0; hP0(:)]);
x2 = state(:, 1: n);
hx2 = state(:, n + 1: 2*n);
P2 = state(:, 2*n:end);

save('ekf_batchreactor_t.mat', 't')
save('ekf_batchreactor_x.mat', 'x')
save('ekf_batchreactor_hx.mat', 'hx')
save('ukf_batchreactor_t.mat', 't2')
save('ukf_batchreactor_x.mat', 'x2')
save('ukf_batchreactor_hx.mat', 'hx2')
