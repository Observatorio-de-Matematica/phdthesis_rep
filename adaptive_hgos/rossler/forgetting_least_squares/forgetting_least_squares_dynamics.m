function dtot = forgetting_least_squares_dynamics(t, u, eps, k, lambda, M, ...
    alpha, beta, tau, betaQ, r0)

ll = length(lambda);

x = u(1:3);
hx = u(4:6);
hx2 = u(7:9);
Q = u(10:(10 + ll^2 - 1));
hlambda = u((10 + ll^2):(10 + ll^2 + 1));
z = u((10 + ll^2 + 2):end);
Q = reshape(Q, ll, []);

y = x(1);

[phi, tx0, tlambda, phi0, tz0] = get_sys_info(x);

dx(1) = x(2);
dx(2) = x(3);
dx(3) = lambda' * phi + phi0;

[hphi, tx0, tlambda, hphi0, tz0] = get_sys_info(hx);
dhlambda = forgetting_least_squares_alg(hlambda, hx(1) - y, Q, hphi, M, tau);

dhx(1) = hx(2) + eps^-1 * k(1) * (y - hx(1));
dhx(2) = hx(3) + eps^-2 * k(2) * (y - hx(1));
dhx(3) = hlambda' * hphi + hphi0 + eps^-3 * k(3) * (y - hx(1));

dhx2(1) = hx2(2) + eps^-1 * k(1) * (y - hx2(1));
dhx2(2) = hx2(3) + eps^-2 * k(2) * (y - hx2(1));
dhx2(3) = eps^-3 * k(3) * (y - hx2(1));

if max(eigs(Q)) <= r0
    dQ = betaQ * Q - Q * hphi * hphi' * Q / (1 + tau * hphi' * hphi);
else
    dQ = 0 * Q;
end

dz(1) = - z(2) - z(3);
dz(2) = z(1);
dz(3) = 0.5 * (z(2) - z(2)^2) - 0.5 * z(3);

dtot = [dx(:); dhx(:); dhx2(:); dQ(:); dhlambda(:); dz(:)];

end
