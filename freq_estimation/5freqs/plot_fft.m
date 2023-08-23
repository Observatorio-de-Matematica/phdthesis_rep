clc
clear
close all

fsize = 17;

fft_amps = csvread('5freq_fft_amps.csv');
fft_freqs = csvread('5freq_fft_freqs.csv');

f = figure(1);
f.Position = [1800 200 800 500];

p1 = subplot(211);
plot(2 * pi * fft_freqs, fft_amps);
grid on;
xlabel('Frequency (rad)', 'fontsize', fsize);
ylabel('Amplitude', 'fontsize', fsize);

p2 = subplot(212);
plot(2 * pi * fft_freqs, fft_amps);
grid on;
xlim([1 60]);

set(p1, 'position', [.1 .1 .8 .8])
set(p2, 'position', [.5 .5 .3 .3])

print('5freqs_fft.eps', '-depsc')
