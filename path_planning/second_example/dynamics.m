function dxtot = dynamics(xtot, R, alpha1)

x = xtot(1:2);
w1 = xtot(3:end);

dphi = grad_basis(x);
f = 1e02 * [
    - 1/4 * x(1)^7 - 1/4 * x(1)^3 * x(2)^4 + 1/6 * x(1)^3;
    - 1/4 * x(1)^4 * x(2)^3 - 1/4 * x(2)^7 + 1/6 * x(2)^3;
];
h = [
    x(2)^3;
    - x(1)^3;
];
q = get_q(x);

u = - 1/2 * (R \ h') * dphi' * w1;

sigma = dphi * (f + h * u);

dx = f + h * u;
barsigma = sigma / (sigma' * sigma + 1)^2;
dw1 = - alpha1 * barsigma * (sigma' * w1 + q + u' * R * u);

dxtot = [dx; dw1];
