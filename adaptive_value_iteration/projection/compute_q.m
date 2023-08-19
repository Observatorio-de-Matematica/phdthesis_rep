syms s
tmp = expand( ...
    det(s * eye(n) - [-astar', eye(n, (n - 1))]) * ...
    (s * eye(n) - [-astar', eye(n, (n - 1))])^-1);

alpha_n_1 = sym(zeros(n, 1));
alpha_n_1(1) = s^(n - 1);
for i = 2:1:n
    alpha_n_1(i) = s^(n - i);
end

syms q [1 (n * n)]
reshape(q, [], n)
reshape(q, [], n) * alpha_n_1 == tmp(:, 1)
