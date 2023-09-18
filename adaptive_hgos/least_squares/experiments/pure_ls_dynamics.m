function dtot = least_squares_dynamics(t, u, eps, k, lambda, M, ...
    L, alpha, beta, gam, tau, q0)

if L == 0
    ll = length(lambda);
else
    ll = L;
end

x = u(1:3);
hx = u(4:6);
hx2 = u(7:9);
Q = u(10:(10 + ll^2 - 1));
hlambda = u((10 + ll^2):end);
Q = reshape(Q, ll, []);

phi = get_sys_info(x);

dx(1) = x(2);
dx(2) = x(3);
dx(3) = lambda' * phi;

if L == 0
    hphi = get_sys_info(hx);
else
    hphi = get_psi(hx, L, alpha, beta, gam);
end
dhlambda = pure_ls_alg(hlambda, hx(1) - x(1), Q, hphi, M, tau);

dhx(1) = hx(2) + eps^-1 * k(1) * (x(1) - hx(1));
dhx(2) = hx(3) + eps^-2 * k(2) * (x(1) - hx(1));
dhx(3) = hlambda' * hphi + eps^-3 * k(3) * (x(1) - hx(1));

dhx2(1) = hx2(2) + eps^-1 * k(1) * (x(1) - hx2(1));
dhx2(2) = hx2(3) + eps^-2 * k(2) * (x(1) - hx2(1));
dhx2(3) = eps^-3 * k(3) * (x(1) - hx2(1));

dQ = - Q * hphi * hphi' * Q / (1 + tau * hphi' * hphi);

dtot = [dx(:); dhx(:); dhx2(:); dQ(:); dhlambda(:)];

end
