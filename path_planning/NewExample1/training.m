clear all
close all
clc

L = length(basis(zeros(2,1)));
R = 1;

odefun = @(t,x) flowDyn(x,R,1e0);

w10 = zeros(L,1);
opt = odeset('RelTol',1e-12,'AbsTol',1e-12);

[xx, yy] = meshgrid(-1.6:0.01:1.6, -1.6:0.01:1.6);
z1 = (-1/4)+((-1)+xx).^2+yy.^2;
z2 = (-1/9)+(0.1E0+xx).^2+((-0.5E0)+yy).^2;
z3 = (-1/9)+(0.1E0+xx).^2+(0.5E0+yy).^2;
[c1,h1] = contour(xx,yy,z1,[0,0]);
[c2,h2] = contour(xx,yy,z2,[0,0]);
[c3,h3] = contour(xx,yy,z3,[0,0]);

for ii = 1:100
    x0 = [-1.3; 0] + [0; 2*rand(1)-1];
    xtot0 = [x0; w10];
    [t,xtot] = ode45(odefun, [0 5], xtot0, opt);
    x = xtot(:,1:2);
    w1 = xtot(:,3:end);
    if ~isnan(w1)
        w10 = w1(end, :)';
    end
    close all
    figure()
    subplot(2,1,1)
    plot(c1(1,2:end),c1(2,2:end),'k--')
    hold on
    fill(c2(1,2:end),c2(2,2:end),'r')
    fill(c3(1,2:end),c3(2,2:end),'r')
    axis equal
    plot(x(:,1),x(:,2))
    xlim([-1.6, 1.6])
    ylim([-1, 1])
    subplot(2,1,2)
    plot(t,w1)
    pause(1)
end

save w10.mat w10