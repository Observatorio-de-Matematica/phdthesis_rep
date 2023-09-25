function dstate = ekf_dynamics(state, Q, iR)

n = 3;

x = state(1:n);
hx = state((n + 1):(2 * n));
P = state((2 * n + 1):(2 * n + n^2));
P = reshape(P, [n, n]);

y = (821/25) .* x(1) + (821/25) .* x(2) + (821/25) .* x(3);

hy = (821/25) .* hx(1) + (821/25) .* hx(2) + (821/25) .* hx(3);

dz = [
    (-1/2).*x(1)+(1/20).*x(2).*x(3);
    (1/2).*x(1)+(-2/5).*x(2).^2+(1/50).*x(3)+(-1/20).*x(2).*x(3);
    (1/2).*x(1)+(1/5).*x(2).^2+(-1/100).*x(3)+(-1/20).*x(2).*x(3);
];

F = [
    (-1/2),(1/20).*hx(3),(1/20).*hx(2);
    (1/2),(-4/5).*hx(2)+(-1/20).*hx(3),(1/50)+(-1/20).*hx(2);
    (1/2),(2/5).*hx(2)+(-1/20).*hx(3),(-1/100)+(-1/20).*hx(2);
];

H = [(821/25), (821/25), (821/25)];

f = [
    (-1/2).*hx(1)+(1/20).*hx(2).*hx(3);
    (1/2).*hx(1)+(-2/5).*hx(2).^2+(1/50).*hx(3)+(-1/20).*hx(2).*hx(3);
    (1/2).*hx(1)+(1/5).*hx(2).^2+(-1/100).*hx(3)+(-1/20).*hx(2).*hx(3);
];

K = P * H' * iR;

dhx = f + K * (y - hy);

dP = F * P + P * F' - K * H * P + Q;

dstate = [dz; dhx; dP(:)];