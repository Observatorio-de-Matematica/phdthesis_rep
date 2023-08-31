clc
clear
close all

fsize = 17;

times = csvread('rt_fivefreqs_times.csv')';
waiting_time = 5;

elaps_time = zeros(size(times, 1), size(times, 2) + 1);

elaps_time(1) = waiting_time;
for i = 2:1:length(elaps_time)
    elaps_time(i) = elaps_time(i - 1) + max(times(i - 1), 0.4096);
end
elaps_time(end) = elaps_time(end - 1) + times(end);

f = figure(1);
f.Position = [1800 200 800 500];

plot(0:size(times, 2), elaps_time, '*');
grid on;
xlabel('Training iteration', 'fontsize', fsize);
ylabel('Time (s)', 'fontsize', fsize);

print('rt_5freqs_elapstime.eps', '-depsc')
