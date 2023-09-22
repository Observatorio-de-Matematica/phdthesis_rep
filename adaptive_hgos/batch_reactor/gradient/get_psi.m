function p = get_psi(x, alpha, beta)
v = 1 ./ (1 + exp(-beta .* x)) + alpha;
p = prod(v, 1)';
end
