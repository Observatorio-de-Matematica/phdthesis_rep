function [psi, a, b] = get_psi_sym(n)
syms a [1 n]
syms b [1 n]

coeffs1 = sym(zeros(1, n + 1));
coeffs2 = sym(zeros(1, n));

coeffs1(1) = 1;
for i = 1:1:n
    coeffs1(i + 1) = a(i);
    coeffs2(i) = b(i);
end

tmp_mat = sym(zeros(2 * n - 1, 2 * n - 1));
for i = 1:1:(n - 1)
    for j = 1:1:(n + 1)
        tmp_mat(i, (i - 1) + j) = coeffs1(j);
    end
end
for i = n:1:(2 * n - 1)
    for j = 1:1:n
        tmp_mat(i, (i - n) + j) = coeffs2(j);
    end
end

h = -(det(tmp_mat))^2;

psi = sym(zeros(2 * n, 1));
for i = 1:1:n
    psi(i) = diff(h, b(i));
end
for i = (n + 1):1:(2 * n)
    psi(i) = diff(h, a(i - n));
end
end
