function h = get_h(n, ha, hb)

coeffs1 = zeros(1, n + 1);
coeffs2 = zeros(1, n);

coeffs1(1) = 1;
for i = 1:1:n
    coeffs1(i + 1) = ha(i);
    coeffs2(i) = hb(i);
end

tmp_mat = zeros(2 * n - 1, 2 * n - 1);
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

h = det(tmp_mat)^2;
end
