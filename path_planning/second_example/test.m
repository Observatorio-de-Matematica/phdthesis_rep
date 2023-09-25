clear

x0s = [
    -0.5, 0;
    0.4, 0.1;
    0, -0.6;
    0, 0.6;
];

opt = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
L = length(basis(zeros(2, 1)));
R = 1;
load w10
odefun2 = @(t, x) testdynamics(x, R, w10);

for i = 1:max(size(x0s))
xtot0 = x0s(i, :);
[t, xtot] = ode45(odefun2, [0 20], xtot0, opt);
x = xtot;

close all
figure()
[xx, yy] = meshgrid(-3:0.01:3, -3:0.01:3);
zz = xx.^4 + yy.^4 - 2/3;
[cc, h] = contour(xx, yy, zz, [0, 0]);
tt = linspace(0, 2 * pi);
plot(cc(1, 2:end), cc(2, 2:end), 'k');
hold on
fill(0.2 * cos(tt) - 0.4, 0.2 * sin(tt) - 0.4, 'r')
fill(0.2 * cos(tt) + 0.5, 0.2 * sin(tt) - 0.2, 'r')
fill(0.2 * cos(tt) + 0.4, 0.2 * sin(tt) + 0.5, 'r')
fill(0.2 * cos(tt) - 0.3, 0.2 * sin(tt) + 0.6, 'r')
plot(x(:, 1), x(:, 2))
axis equal
pause(1)
end
