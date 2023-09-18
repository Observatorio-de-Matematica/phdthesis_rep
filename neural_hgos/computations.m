clc
clear
close all

w = [50, 0, 10, 10];
times = 0:0.05:30;

gain_vals = zeros(1, length(times));
dgain_vals = zeros(1, length(times));

for i = 1:1:length(times)
    gain_vals(i) = gain(times(i), w);
    dgain_vals(i) = dgain(times(i), w);
end

a = 50;
figure(1); hold on
plot(times, gain_vals)
plot(times, dgain_vals ./ gain_vals)

figure(2); hold on
plot(times, dgain_vals)
plot(times, zeros(1, length(times)) + w(1) / 4);

function out = sigma(r)
out = exp(r) / (1 + exp(r));
end

function out = gain(t, w)
out = w(1) * sigma(t - w(2)) - w(3) * sigma(t - w(4));
end

function out = dgain(t, w)
out = ((w(3)*exp(2*t-2*w(4)))/((exp(t-w(4))+1)^2))- ...
    ((w(1)*exp(2*t-2*w(2)))/((exp(t-w(2))+1)^2))- ...
    ((w(3)*exp(t-w(4)))/(exp(t-w(4))+1))+ ...
    ((w(1)*exp(t-w(2)))/(exp(t-w(2))+1));
end
