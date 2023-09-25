function dx = testdynamics(xtot, R, w1)

x = xtot(1:2);

dphi = grad_basis(x);
f = 10 * [
    - 1/4 * x(1)^7 - 1/4 * x(1)^3 * x(2)^4 + 1/6 * x(1)^3;
    - 1/4 * x(1)^4 * x(2)^3 - 1/4 * x(2)^7 + 1/6 * x(2)^3;
];
h = 10 * [
    x(2)^3;
    - x(1)^3;
];
q = get_q(x);

u = - 1/2 * (R \ h') * dphi' * w1;
dx = f + h * u;
