clear all
close all
clc

L = length(basis(zeros(2, 1)));
R = 1;
plot_tr = 1;

odefun = @(t, x) dynamics(x, R);

w10 = randn(L, 1) / sqrt(L);
%load w10
opt = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
w11 = w10;

NN = 100;
for ii = 1:NN
    x0 = [-2; 0] + 2 * randn(2, 1);
    if sum(isnan(w11)) == 0
        w10 = w11;
    end
    xtot0 = [x0; w10];
    [t, xtot] = ode45(odefun, [0 2], xtot0, opt);
    x = xtot(:, 1:2);
    w1 = xtot(:, 3:end);
    w11 = w1(end, :)';
    if plot_tr == 1
        close all
        figure()
        subplot(211)
        tt = linspace(0, 2 * pi);
        plot(1/2 * cos(tt) + 1, 1/2 * sin(tt), '--')
        hold on
        fill(1/3 * cos(tt) - 1/10, 1/3 * sin(tt) + 1/2, 'r')
        fill(1/3 * cos(tt) - 1/10, 1/3 * sin(tt) - 1/2, 'r')

        %plot(cos(tt)+3,sin(tt),'--')
        %hold on
        %fill(0.5*cos(tt)+1.5,0.5*sin(tt)+1,'r')
        %fill(0.5*cos(tt)+1.5,0.5*sin(tt)-1,'r')

        plot(x(:, 1), x(:, 2))
        axis equal
        subplot(212)
        plot(t, w1)
        pause(0.5)
    end
end

save w10.mat w10

xtot0 = [-0.5; 0.1; w10];
[t, xtot] = ode45(odefun, [0 10], xtot0, opt);
x = xtot(:, 1:2);
w1 = xtot(:, 3:end);
w11 = w1(end, :)';
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
