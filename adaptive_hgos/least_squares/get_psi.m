function psi = get_psi(x, L, alpha, beta)

v = 1 ./ (1 + exp(- beta .* x)) + alpha;
psi = prod(v, 1)';

end
