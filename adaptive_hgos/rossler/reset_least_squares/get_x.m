function z = get_z(x)
    N = max(size(x));
    z = zeros(N, 3);
    for i = 1:1:max(size(x))
        z(i, 1) = x(i, 2);
        z(i, 2) = x(i, 1);
        z(i, 3) = - x(i, 3) - x(i, 1);
    end
end
