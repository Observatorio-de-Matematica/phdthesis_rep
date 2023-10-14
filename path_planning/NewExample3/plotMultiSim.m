clear all
close all
clc

load w10.mat
R = 1;

opt = odeset('RelTol',1e-6,'AbsTol',1e-6);
odefun = @(t,x) flowDyn(x,R,0);

[x_1, x_2] = meshgrid(-1.6:0.01:1.6, -1.6:0.01:1.6);
z1 = x_1.^4-x_1.^2+x_2.^2-1/9;
z2 = (-1/49)+x_1.^2+((-0.6E0)+x_2).^2;
[c1,h1] = contour(x_1,x_2,z1,[0,0]);
[c2,h2] = contour(x_1,x_2,z2,[0,0]);

x0 = [-0.1; 0.9];
[~,xtot] = ode45(odefun, [0 6], [x0; w10], opt);
x1 = xtot(:,1:2);
x0 = [0.15; 0.8];
[~,xtot] = ode45(odefun, [0 6], [x0; w10], opt);
x2 = xtot(:,1:2);
x0 = [-0.2; 0.7];
[~,xtot] = ode45(odefun, [0 6], [x0; w10], opt);
x3 = xtot(:,1:2);
x0 = [0.3; 0.7];
[~,xtot] = ode45(odefun, [0 6], [x0; w10], opt);
x4 = xtot(:,1:2);

%%
figure()
tt = linspace(0,2*pi);
plot(c1(1,2:end),c1(2,2:end),'k','linewidth',2)
hold on
f1 = fill(c2(1,2:end),c2(2,2:end),[0.5 0.5 0.5]);
hatchfill(f1,'single',30,10)
plot(x1(:,1),x1(:,2),'--','linewidth',1,'color',[0.2,0.2,0.2])
plot(x2(:,1),x2(:,2),'-.','linewidth',1,'color',[0.2,0.2,0.2])
plot(x3(:,1),x3(:,2),':','linewidth',1,'color',[0.2,0.2,0.2])
plot(x4(:,1),x4(:,2),'-','linewidth',1,'color',[0.2,0.2,0.2])
axis equal
xlim([-1.6, 1.6])
ylim([-1, 1])
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
box on
saveas(gcf,'ellsim3.eps','epsc')