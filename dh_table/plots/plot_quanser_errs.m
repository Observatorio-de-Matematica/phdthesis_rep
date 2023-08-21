clc
clear
close all

estim_traj = csvread('estim_traj.csv');
nominal_traj = csvread('nominal_traj.csv');
samples = csvread('samples.csv');

ts = 0.01;
t0 = 0;
tf = 10;
times = 0:ts:(tf - ts);

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(311); hold on;
plot(times, samples(1, :) - nominal_traj(1, :));
plot(times, samples(1, :) - estim_traj(1, :));
grid on;
set(gca, 'xticklabel', []);
yticks([-10, -5, 0] * 1e-3)
l1 = legend('$y_1(t)-f_1(u(t),p_2,p_3,p_4)$', ...
    '$y_1(t)-f_1(u(t),\hat p_2,\hat p_3,\hat p_4)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5);

p2 = subplot(312); hold on;
plot(times, samples(2, :) - nominal_traj(2, :));
plot(times, samples(2, :) - estim_traj(2, :));
grid on;
set(gca, 'xticklabel', []);
yticks([-0.005, 0, 0.005])
l2 = legend('$y_2(t)-f_2(u(t),p_2,p_3,p_4)$', ...
    '$y_2(t)-f_2(u(t),\hat p_2,\hat p_3,\hat p_4)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5);

p3 = subplot(313); hold on;
plot(times, samples(3, :) - nominal_traj(3, :));
plot(times, samples(3, :) - estim_traj(3, :));
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
yticks([-0.01, -0.005, 0, 0.005, 0.01])
l3 = legend('$y_3(t)-f_3(u(t),p_2,p_3,p_4)-p_1$', ...
    '$y_3(t)-f_3(u(t),\hat p_2,\hat p_3,\hat p_4)-\hat p_1$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])

print('quanser_errors.eps', '-depsc')
