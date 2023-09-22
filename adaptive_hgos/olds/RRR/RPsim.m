clear all
close all
clc

rng(123)
eps = 0.85;
gamma = 1.2;
lam = [0.5; 0.5];
M = 1;

Tf = 250;

n = 3;
Ae = [-2/eps, 1, 0; 
    -2/eps^2, 0, 1;
    -1/eps^3, 0, 0];
Be = -Ae(:,1);

tdist = 0:1e-1:Tf;
dist = 1e-2*randn(1,length(tdist));

odefun = @(t,x) RPobserver(t, tdist, dist, x, Ae, Be, gamma, M, lam);

x0 = [0.1; 0.3; 0];
hx0 = zeros(n,1);
hx02 = zeros(n,1);

m = length(Phi(hx0));

hl0 = zeros(m,1);

tspan = [0,Tf];

[t, state] = ode23s(odefun, tspan, [x0; hx0; hx02; hl0]);

z = state(:, 1: n);
y = z(:,2) + delta(t,tdist,dist);
hx = state(:, n + 1: 2*n);
hx2 = state(:, 2*n + 1: 3*n);
hlam = state(:, 3*n + 1: end);

x = obsMapRP(z);

%%
figure('Position',[0, 0, 400, 400])
plot3(x(:,1), x(:,2), x(:,3), 'linewidth',1)
view(110,31)
box on
grid on
set(gca,'TickLabelInterpreter','latex')
xlabel('$x_1$','interpreter','latex','fontsize',14)
ylabel('$x_2$','interpreter','latex','fontsize',14)
zlabel('$x_3$','interpreter','latex','fontsize',14)

%%
fig = figure('Position',[0, 0, 400, 380]);
p1 = subplot(4,1,1);
plot(t, x, 'linewidth', 1)
hold on
plot(t, y, 'linewidth', 1)
ylim([-1.6 2.6])
xticklabels('')
ylabel('$x,\,y$','interpreter','latex','fontsize',14)
grid on
box on
set(gca,'TickLabelInterpreter','latex')
l1 = legend('$x_1$','$x_2$','$x_3$','$y$', 'interpreter','latex',...
    'fontsize',14,'location','eastOutside');

p2 = subplot(4,1,2);
plot(t, hx2 - x, 'linewidth', 1)
ylim([-2.5 2.5])
xticklabels('')
ylabel('$\tilde{x}_{\mathrm{p}}$','interpreter',...
    'latex','fontsize',14)
grid on
box on
set(gca,'TickLabelInterpreter','latex')
l2 = legend('$\tilde{x}_{\mathrm{p},1}$',...
    '$\tilde{x}_{\mathrm{p},2}$',...
    '$\tilde{x}_{\mathrm{p},3}$','interpreter','latex','fontsize',14,...
    'location','eastOutside');

p3 = subplot(4,1,3);
plot(t, hx - x, 'linewidth', 1)
ylim([-0.3 0.3])
xticklabels('')
ylabel('$\tilde{x}_{\mathrm{b}}$','interpreter',...
    'latex','fontsize',14)
grid on
box on
set(gca,'TickLabelInterpreter','latex')
l3 = legend('$\tilde{x}_{\mathrm{b},1}$',...
    '$\tilde{x}_{\mathrm{b},2}$',...
    '$\tilde{x}_{\mathrm{b},3}$','interpreter','latex','fontsize',14,...
    'location','eastOutside');

p4 = subplot(4,1,4);
plot(t, hlam - lam', 'linewidth', 1)
ylabel('$\tilde{\lambda}_{\mathrm{b}}$','interpreter',...
    'latex','fontsize',14)
ylim([-1.3 0.7])
grid on
box on
set(gca,'TickLabelInterpreter','latex')
% xlabel('$t$','interpreter','latex','fontsize',14)
l4 = legend('$\tilde{\lambda}_{\mathrm{b},1}$',...
    '$\tilde{\lambda}_{\mathrm{b},2}$'...
    ,'interpreter','latex','fontsize',14,...
    'location','eastOutside');

pos1 = get(p1,'Position');
pos2 = get(p2,'Position');
pos3 = get(p3,'Position');
pos4 = get(p4,'Position');

bias = pos4(2);
range = pos1(2) + pos1(4) - pos4(2);
hh = range/4;

pos1(4) = hh;
pos2(4) = hh;
pos3(4) = hh;
pos4(4) = hh;

pos1(2) = bias + 3*hh;
pos2(2) = bias + 2*hh;
pos3(2) = bias + hh;

pos1(3) = 0.65;
pos2(3) = 0.65;
pos3(3) = 0.65;
pos4(3) = 0.65;

set(p1, 'Position', pos1);
set(p2, 'Position', pos2);
set(p3, 'Position', pos3);
set(p4, 'Position', pos4);

pl1 = get(l1, 'Position');
pl4 = get(l4, 'Position');

pl4(1) = pl1(1);

set(l4, 'Position', pl4);

saveas(fig,'ross.eps','epsc')