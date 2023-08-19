function du = dynamics(t, u, A, b, C, r, gamma, beta, epsilon, astar, delta)

n = size(A, 1);

x = u(1:n);
hx = u((n + 1):(2 * n));
ha = u((2 * n + 1):(3 * n));
hb = u((3 * n + 1):(4 * n));
phi1 = u((4 * n + 1):(5 * n));
phi2 = u((5 * n + 1):(6 * n));
P = reshape(u((6 * n + 1):(6 * n + n^2)), [], n);

y = C * x;
d = 0;
for i = 1:2:(2 * n)
    d = d + sin(i * t);
end
up = - r^-1 * hb' * P * hx + d;

ovrC = eye(n, 1)';
phi = [phi1; phi2];

h = get_h(n, ha, hb);
if (h < -delta) || (h == -delta && (y - ovrC * hx) * phi' * psi <= 0)
    dha = gamma * (y - ovrC * hx) / (1 + beta * phi' * phi) * phi2;
    dhb = gamma * (y - ovrC * hx) / (1 + beta * phi' * phi) * phi1;
else
    psi = get_psi(n, ha, hb);
    dhtheta = gamma * (y - ovrC * hx) / (1 + beta * phi' * phi) * ( ...
        eye(2 * n) - psi * psi' / (psi' * psi)) * [phi2; phi1];
    dha = dhtheta(1:n);
    dhb = dhtheta((n + 1):(2 * n));
end

v = compute_v(n, dha, dhb, phi1, phi2);
hA = [-ha, eye(n, n - 1)];

dhx = hA * hx + hb * up + (astar' - ha) * (y - ovrC * hx) + v;
dx = A * x + b * up;

dP = epsilon^-1 * (hA' * P + P * hA + ovrC' * ovrC - r^-1 * P * hb * hb' * P);

dphi1 = [-astar; eye(n, n - 1)'] * phi1 + eye(n, 1) * up;
dphi2 = [-astar; eye(n, n - 1)'] * phi2 + eye(n, 1) * (-y);

du = [dx; dhx; dha; dhb; dphi1; dphi2; dP(:)];

end
