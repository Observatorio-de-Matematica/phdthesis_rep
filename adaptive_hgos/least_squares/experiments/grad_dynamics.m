function dtot = grad_dynamics(t, u, gamma, eps, k, lambda, M, ...
    L, alpha, beta, tau, nn)

x = u(1:3);
hx = u(4:6);
hx2 = u(7:9);
hlambda = u(10:end);

y = x(1) + nn * (x(1) + x(2) + x(3));

phi = get_sys_info(x);

dx(1) = x(2);
dx(2) = x(3);
dx(3) = lambda' * phi;

if L == 0
    hphi = get_sys_info(hx);
else
    hphi = get_psi(hx, L, alpha, beta);
end
dhlambda = grad_alg(hlambda, hx(1) - y, hphi, M, gamma, tau);

dhx(1) = hx(2) + eps^-1 * k(1) * (y - hx(1));
dhx(2) = hx(3) + eps^-2 * k(2) * (y - hx(1));
dhx(3) = hlambda' * hphi + eps^-3 * k(3) * (y - hx(1));

dhx2(1) = hx2(2) + eps^-1 * k(1) * (y - hx2(1));
dhx2(2) = hx2(3) + eps^-2 * k(2) * (y - hx2(1));
dhx2(3) = eps^-3 * k(3) * (y - hx2(1));

dtot = [dx(:); dhx(:); dhx2(:); dhlambda(:)];

end
