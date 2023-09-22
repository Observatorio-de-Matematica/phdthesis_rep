function dstate = ekf_dynamics(t, tdist, dist, state, lam, Q, iR)
    
n = 3;
m = 5;

z = state(1:n);
hx = state((n + 1):(n + m));
P = state((n + m + 1):(n + m + m^2));

y = z(2) + disturbance(t, tdist, dist);
hy = hx(1);

P = reshape(P, [m, m]);

dz = [
    -z(2) - z(3);
    z(1);
    lam(1) * (z(2) - z(2)^2) - lam(2) * z(3);
];

F = [
    0, 1, 0, 0, 0;
    0, 0, 1, 0, 0;
    (-1) .* (1+ (-2) .* hx(1)) .* hx(4) + (-1) .* hx(5), (-1), ...
        (-1) .* hx(5), (-1) .* hx(1) + hx(1).^2, (-1) .* hx(1) + (-1) .* hx(3);
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
];

H = [1, 0, 0, 0, 0];

K = P * H' * iR;

f = [
    hx(2);
    hx(3);
    (-1) .* hx(2)+ (-1) .* (hx(1) + (-1) .* hx(1).^2) .* hx(4) + ...
        ((-1) .* hx(1) + (-1) .* hx(3)) .* hx(5);
    0;
    0;
];

dhx = f + K * (y - hy);

dP = F * P + P * F' - K * H * P + Q;

dstate = [dz; dhx; dP(:)];
