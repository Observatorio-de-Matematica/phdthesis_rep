function p = grad_alg(hl, tildey, phi, M, gamma)

if (hl' * hl < M) || (tildey * hl' * phi >= 0)
    p = - gamma * tildey * phi;
else
    p = 0 * hl;
end

end
