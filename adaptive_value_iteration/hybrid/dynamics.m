function du = dynamics(t, u, A, b, C, r, gamma, beta, astar, delta, ak, bk, Pk)

n = size(A, 1);

x = u(1:n);
hx = u((n + 1):(2 * n));
ha = u((2 * n + 1):(3 * n));
hb = u((3 * n + 1):(4 * n));
phi1 = u((4 * n + 1):(5 * n));
phi2 = u((5 * n + 1):(6 * n));

y = C * x;
d = 0;
for i = 1:2:(4 * n)
    d = d + sin(i * t);
end

ovrC = eye(n, 1)';
phi = [phi1; phi2];

z = y + astar * phi2;
htheta = [hb; ha];
dha = gamma * (z - htheta' * phi) / (1 + beta * phi' * phi) * phi2;
dhb = gamma * (z - htheta' * phi) / (1 + beta * phi' * phi) * phi1;

hA = [-ak, eye(n, n - 1)];

up = - r^-1 * bk' * Pk * hx + d;

dhx = hA * hx + bk * up + (astar' - ak) * (y - ovrC * hx);
dx = A * x + b * up;

dphi1 = [-astar; eye(n, n - 1)'] * phi1 + eye(n, 1) * up;
dphi2 = [-astar; eye(n, n - 1)'] * phi2 + eye(n, 1) * (-y);

du = [dx; dhx; dha; dhb; dphi1; dphi2];

end
