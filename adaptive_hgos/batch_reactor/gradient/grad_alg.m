function p = grad_alg(hl, tildey, phi, M, gamma, tau)

m = 1 + tau * phi' * phi;
if (hl' * hl < M) || (tildey * hl' * phi >= 0)
    p = - gamma * tildey * phi / m;
else
    p = - gamma * tildey * phi / m + ...
        gamma * (tildey * hl' * phi) / (hl' * hl) * hl / m;
end

end
