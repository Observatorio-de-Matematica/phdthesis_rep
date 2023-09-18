function p = least_squares_alg(hl, tildey, Q, phi, M, tau)

m = 1 + tau * phi' * phi;
if (hl' * hl < M) || (tildey * hl' * phi >= 0)
    p = - Q * tildey * phi / m;
else
    p = 0 * phi;
end

end
