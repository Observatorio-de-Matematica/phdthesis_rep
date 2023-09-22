clear all
close all
clc

rng(123)
n = 3;
m = 5;
lam = [0.5; 0.5];
Q = eye(5);
iR = eye(1);

Tf = 250;

tdist = 0:1e-1:Tf;
dist = 1e-2*randn(1,length(tdist));

odefun = @(t,x) RPEKF(t, tdist, dist, x, lam, Q, iR);

x0 = [0.1; 0.3; 0];
hx0 = zeros(m,1);
hP0 = eye(m);

tspan = [0,Tf];

[t, state] = ode45(odefun, tspan, [x0; hx0; hP0(:)]);

z = state(:, 1:n);
hx = state(:, n+1:2*n);
hlam = state(:, 2*n+1:n+m);
P = state(:, n+m+1:end);

x = obsMapRP(z);

%%
figure()
fs = 14;
plot(t, P, 'linewidth', 1)
xlim([0 Tf])
xlabel('$t$','interpreter','latex','fontsize',fs)
ylabel('$P$','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')

%%
fig = figure('Position',[0, 0, 400, 190]);

p1 = subplot(2,1,1);
plot(t, hx - x, 'linewidth', 1)
xlim([0 Tf])
ylim([-0.3 0.3])
ticks = get(p1,'xtick');
set(p1,'xtick',ticks)
xticklabels('')
ylabel('$\tilde{x}_{\mathrm{EKF}}$','interpreter',...
    'latex','fontsize',fs)
grid on
box on
set(gca,'TickLabelInterpreter','latex')
l1 = legend('$\tilde{x}_{\mathrm{EKF},1}$',...
    '$\tilde{x}_{\mathrm{EKF},2}$',...
    '$\tilde{x}_{\mathrm{EKF},3}$','interpreter','latex','fontsize',fs,...
    'location','eastOutside');

p2 = subplot(2,1,2);
plot(t, hlam - lam', 'linewidth', 1)
ylabel('$\tilde{\lambda}_{\mathrm{EKF}}$','interpreter',...
    'latex','fontsize',fs)
xlim([0 Tf])
ylim([-0.7 0.2])
set(p2,'xtick',ticks)
grid on
box on
set(gca,'TickLabelInterpreter','latex')
% xlabel('$t$','interpreter','latex','fontsize',fs)
l2 = legend('$\tilde{\lambda}_{\mathrm{EKF},1}$',...
    '$\tilde{\lambda}_{\mathrm{EKF},2}$'...
    ,'interpreter','latex','fontsize',fs,...
    'location','eastOutside');

pos1 = get(p1,'Position');
pos2 = get(p2,'Position');

bias = pos2(2);
range = pos1(2) + pos1(4) - pos2(2);
hh = range/2;

pos1(4) = hh;
pos2(4) = hh;

pos1(2) = bias + hh;

pos1(3) = 0.65;
pos2(3) = 0.65;

set(p1, 'Position', pos1);
set(p2, 'Position', pos2);

pl1 = get(l1, 'Position');
pl2 = get(l2, 'Position');

pl2(1) = pl1(1);

set(l2, 'Position', pl2);

saveas(fig,'RPEKF.eps','epsc')
