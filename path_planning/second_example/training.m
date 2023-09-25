clear all
close all
clc

rng(1)

L = length(basis(zeros(2, 1)));
R = 1;
alpha1 = 1e02;
plot_tr = 1;

[xx, yy] = meshgrid(-3:0.01:3, -3:0.01:3);
zz = xx.^4 + yy.^4 - 2/3;
[cc, h] = contour(xx, yy, zz, [0, 0]);
tt = linspace(0, 2 * pi);

odefun = @(t, x) dynamics(x, R, alpha1);

%w10 = randn(L, 1) / sqrt(L);
w10 = zeros(L, 1);
%load w10
opt = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
w11 = w10;

NN = 100;
for ii = 1:NN
    %x0 = [-1 + 2 * rand(1); - 1 + 2 * rand(1)];
    x0 = [0; 0] + 0.1 * randn(2, 1);

    if mod(ii, 10) == 0
        disp(ii)
    end

    while (in_obstacle(x0) == 1)
        x0 = [-1 + 2 * rand(1); - 1 + 2 * rand(1)];
    end

    if sum(isnan(w11)) == 0
        w10 = w11;
    end
    xtot0 = [x0; w10];
    [t, xtot] = ode45(odefun, [0 20], xtot0, opt);
    x = xtot(:, 1:2);
    w1 = xtot(:, 3:end);
    w11 = w1(end, :)';
    if plot_tr == 1
        close all
        figure()
        subplot(211)
        tt = linspace(0, 2 * pi);
        plot(cc(1, 2:end), cc(2, 2:end), 'k');
        hold on
        fill(0.2 * cos(tt) - 0.4, 0.2 * sin(tt) - 0.4, 'r')
        fill(0.2 * cos(tt) + 0.5, 0.2 * sin(tt) - 0.2, 'r')
        fill(0.2 * cos(tt) + 0.4, 0.2 * sin(tt) + 0.5, 'r')
        fill(0.2 * cos(tt) - 0.3, 0.2 * sin(tt) + 0.6, 'r')
        plot(x(:, 1), x(:, 2))
        axis equal
        subplot(212)
        plot(t, w1)
        pause(1)
    end
end

save w10.mat w10
