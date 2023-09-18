clc
clear
close all

fsize = 17;

noise_samples = csvread('cs1_noise.csv');

tt = 0:0.01:(50 - 0.01);

f = figure(1);
f.Position = [1800 200 800 500];

plot(tt, noise_samples);
grid on;
xlabel('t', 'fontsize', fsize);
ylabel('w(t)', 'fontsize', fsize);

print('signum_noise.eps', '-depsc')
