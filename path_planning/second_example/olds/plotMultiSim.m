clear all
close all
clc

load w10.mat
R = 1;

opt = odeset('RelTol',1e-6,'AbsTol',1e-6);
odefun = @(t,x) flowDyn(x,R);

x0 = [-0.1; 0];
[~,xtot] = ode45(odefun, [0 3], [x0; w10], opt);
x1 = xtot(:,1:2);
x0 = [0.1; 0];
[~,xtot] = ode45(odefun, [0 3], [x0; w10], opt);
x2 = xtot(:,1:2);
x0 = [0; 0.1];
[~,xtot] = ode45(odefun, [0 3], [x0; w10], opt);
x3 = xtot(:,1:2);
x0 = [0; -0.1];
[~,xtot] = ode45(odefun, [0 3], [x0; w10], opt);
x4 = xtot(:,1:2);

%%
figure()
[xx, yy] = meshgrid(-3:0.01:3, -3:0.01:3);
zz = xx.^4+yy.^4-4;
[cc, h] = contour(xx,yy,zz, [0,0]);
plot(cc(1,2:end), cc(2,2:end),'k','linewidth',2);
hold on
tt = linspace(0,2*pi);
f1 = fill(0.2*cos(tt)+0.7,0.2*sin(tt)-1,[0.5 0.5 0.5]);
hatchfill(f1,'single',30,10)
f2 = fill(0.3*cos(tt)-0.2,0.3*sin(tt)+1,[0.5 0.5 0.5]);
hatchfill(f2,'single',30,10);
f3 = fill(0.1*cos(tt)+0.5,0.1*sin(tt)+0.5,[0.5 0.5 0.5]);
hatchfill(f3,'single',30,10);
f4 = fill(0.4*cos(tt)-0.5,0.4*sin(tt)-0.5,[0.5 0.5 0.5]);
hatchfill(f4,'single',30,10);
plot(x1(:,1),x1(:,2),'--','linewidth',1,'color',[0.2,0.2,0.2])
plot(x2(:,1),x2(:,2),'-.','linewidth',1,'color',[0.2,0.2,0.2])
plot(x3(:,1),x3(:,2),':','linewidth',1,'color',[0.2,0.2,0.2])
plot(x4(:,1),x4(:,2),'-','linewidth',1,'color',[0.2,0.2,0.2])
axis equal
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
box on
saveas(gcf,'ellsim2.eps','epsc')