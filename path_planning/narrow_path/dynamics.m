function dxtot = dynamics(xtot, R)

alpha1 = 100;

x = xtot(1:2);
w1 = xtot(3:end);

dphi = grad_basis(x);
f = [
    -1/2 * x(1)^3 + 3/2 * x(1)^2 - 1/2 * x(2)^2 * x(1) - 11/8 * x(1) + ...
        1/2 * x(2)^2 + 3/8;
    -1/2 * x(2)^3 - 1/2 * x(1)^2 * x(2) + x(1) * x(2) - 3/8 * x(2);
];
h = [
    x(2);
    1 - x(1);
];
q = get_q(x);

u = -1/2 * inv(R) * h' * dphi' * w1;

sigma = dphi * (f + h * u);

dx = f + h * u;
barsigma = sigma / (sigma' * sigma + 1)^2;
dw1 = - alpha1 * barsigma * (sigma' * w1 + q + u' * R * u);

dxtot = [dx; dw1];
