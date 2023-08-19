function v = compute_v(n, dha, dhb, phi1, phi2)

v = 0;
if n == 2
    Q1 = [
        1, 0;
        0, -2;
    ];
    Q2 = [
        0, 1;
        1, 2;
    ];
    v = Q1 * (phi1 * dhb(1) + phi2 * dha(1)) + ...
        Q2 * (phi1 * dhb(2) + phi2 * dha(2));
end

if n == 3
    Q1 = [
        1, 0, 0;
        0, -2, -1;
        0, -1, 0;
    ];
    Q2 = [
        0, 1, 0;
        1, 2, 0;
        0, 0, -1;
    ];
    Q3 = [
        0, 0, 1;
        0, 1, 2;
        1, 2, 2;
    ];
    v = Q1 * (phi1 * dhb(1) + phi2 * dha(1)) + ...
        Q2 * (phi1 * dhb(2) + phi2 * dha(2)) + ...
        Q3 * (phi1 * dhb(3) + phi2 * dha(3));
end

end
