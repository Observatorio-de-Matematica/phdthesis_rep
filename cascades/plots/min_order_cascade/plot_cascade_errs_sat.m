clc
clear
close all

fsize = 17;

ts = 0.01;
tf = 10;
times = 0:ts:(tf - ts);

u_hgo = csvread('u_hgo.csv');
hu_hgo = csvread('hu_hgo.csv');
u_casc = csvread('u_mincascade.csv');
hu_casc = csvread('hu_mincascade.csv');

f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(311); hold on;
plot(times, hu_casc(1, :), 'g')
plot(times, hu_hgo(1, :), 'b--')
set(gca, 'xticklabel', []);
grid on;
%yticks([-1, -0.5, 0, 0.5]);
ylabel('$\tilde\xi_1$', 'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(312); hold on;
plot(times, hu_casc(2, :), 'g')
plot(times, hu_hgo(2, :), 'b--')
set(gca, 'xticklabel', []);
grid on;
%yticks([0 10 20 30]);
ylabel('$\tilde\xi_2$', 'interpreter', 'latex', 'fontsize', fsize);

p3 = subplot(313); hold on;
plot(times, hu_casc(3, :), 'g')
plot(times, hu_hgo(3, :), 'b--')
grid on;
%yticks([-200 0 200]);
ylabel('$\tilde\xi_3$', 'interpreter', 'latex', 'fontsize', fsize);
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])

print('comparison_asym_cascade.eps', '-depsc')
