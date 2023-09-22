clc
clear
close all

hlam = load('grad_batchreactor_hlam.mat'); hlam = hlam.hlam;
hx = load('grad_batchreactor_hx.mat'); hx = hx.hx;
hz = load('grad_batchreactor_hz.mat'); hz = hz.hz;
t = load('grad_batchreactor_t.mat'); t = t.t;
x = load('grad_batchreactor_x.mat'); x = x.x;
z = load('grad_batchreactor_z.mat'); z = z.z;

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(311);
plot(t, x - hx);
grid on;
set(gca, 'xticklabel', []);
%yticks([-2, -1, 0, 1])
ylabel('$\tilde x(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(312);
plot(t, hlam);
grid on;
set(gca, 'xticklabel', []);
%yticks([-1, 0, 1])
ylabel('$\hat\lambda(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

p3 = subplot(313);
plot(t, z - hz);
grid on;
xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
%yticks([-5, 0, 5, 10])
ylabel('$\tilde z(t)$', ...
    'interpreter', 'latex', 'fontsize', fsize);

set(p1, 'position', [.1 .6334 .8 .266])
set(p2, 'position', [.1 .3667 .8 .266])
set(p3, 'position', [.1 .1    .8 .266])

print('batchreactor_grad.eps', '-depsc')
