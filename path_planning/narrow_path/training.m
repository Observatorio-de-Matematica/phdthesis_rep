clear all
close all
clc

L = length(basis(zeros(2, 1)));
R = 1;

odefun = @(t, x) dynamics(x, R);

w10 = zeros(L, 1);
%load w10
opt = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);

for ii = 1:1
    close all
    x0 = [-0.5; 0];
    xtot0 = [x0; w10];
    [t, xtot] = ode45(odefun, [0 10], xtot0, opt);
    x = xtot(:, 1:2);
    w1 = xtot(:, 3:end);
    w10 = w1(end, :)';
    figure()
    subplot(211)
    tt = linspace(0, 2 * pi);
    plot(1/2 * cos(tt) + 1, 1/2 * sin(tt), '--')
    hold on
    fill(1/3 * cos(tt) - 1/10, 1/3 * sin(tt) + 1/2, 'r')
    fill(1/3 * cos(tt) - 1/10, 1/3 * sin(tt) - 1/2, 'r')
    plot(x(:, 1), x(:, 2))
    axis equal
    subplot(212)
    plot(t, w1)
    pause(1)
end

save w10.mat w10
