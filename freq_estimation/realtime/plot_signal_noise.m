clc
clear
close all

t0 = 0;
tf = 20;
ts = 1e-01;

times = t0:ts:(tf - ts);

fsize = 17;

signal = csvread('realtime_samples.csv');
noise = csvread('realtime_noise.csv');

f = figure(1);
f.Position = [1800 200 800 500];

plot(times, signal);
hold on;
plot(times, noise);
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
legend('$s(t)$', 'w(t)', 'interpreter', 'latex', 'fontsize', fsize - 5);

print('realtime_signal_noise.eps', '-depsc')
