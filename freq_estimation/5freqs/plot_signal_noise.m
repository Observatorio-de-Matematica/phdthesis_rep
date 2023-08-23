clc
clear
close all

t0 = 0;
tf = 60;
ts = 1e-02;

times = t0:ts:(tf - ts);

fsize = 17;

signal = csvread('5freq_samples.csv');
noise = csvread('5freq_noise.csv');

f = figure(1);
f.Position = [1800 200 800 500];

plot(times, signal);
hold on;
plot(times, noise);
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
legend('$s(t)$', 'w(t)', 'interpreter', 'latex', 'fontsize', fsize - 5);

print('5freqs_signal_noise.eps', '-depsc')
