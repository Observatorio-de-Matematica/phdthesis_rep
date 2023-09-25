clear all
close all
clc

L = length(basis(zeros(2,1)));
R = 1;

odefun = @(t,x) flowDyn(x,R);

w10 = zeros(L,1);
opt = odeset('RelTol',1e-6,'AbsTol',1e-6);

[xx, yy] = meshgrid(-3:0.01:3, -3:0.01:3);
zz = xx.^4+yy.^4-4;
zz = xx.^4+yy.^4-2/3;
[cc, h] = contour(xx,yy,zz, [0,0]);
tt = linspace(0,2*pi);

% figure()
% 
% hold on
% fill(,'r')
% fill(,'r')
% fill(,'r')
% fill(,'r')
% axis equal


for ii = 1:100
    close all
    x0 = [0; 0] + .1*randn(2,1);
    xtot0 = [x0; w10];
    [t,xtot] = ode45(odefun, [0 20], xtot0, opt);
    x = xtot(:,1:2);
    w1 = xtot(:,3:end);
    w10 = w1(end, :)';
    figure()
    subplot(2,1,1)
    plot(cc(1,2:end), cc(2,2:end),'k');
    hold on
    %fill(0.3*cos(tt)+0.7,0.3*sin(tt)-1,'r')
    %fill(0.3*cos(tt)-0.2,0.3*sin(tt)+1,'r')
    %fill(0.3*cos(tt)+0.5,0.3*sin(tt)+0.5,'r')
    %fill(0.3*cos(tt)-0.5,0.3*sin(tt)-0.5,'r')

    fill(0.2 * cos(tt) - 0.4, 0.2 * sin(tt) - 0.4, 'r')
    fill(0.2 * cos(tt) + 0.5, 0.2 * sin(tt) - 0.2, 'r')
    fill(0.2 * cos(tt) + 0.4, 0.2 * sin(tt) + 0.5, 'r')
    fill(0.2 * cos(tt) - 0.3, 0.2 * sin(tt) + 0.6, 'r')

    plot(x(:,1),x(:,2),'b')
    axis equal
    subplot(2,1,2)
    plot(t,w1)
    pause(1)
end

save w10.mat w10
