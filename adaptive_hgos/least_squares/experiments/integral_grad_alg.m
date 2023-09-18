function p = integral_grad_alg(gamma, R, hl, Q, M)

%if (hl' * hl < M) || (p' * (R * hl + Q)  >= 0)
    p = - gamma * (R + Q);
%else
%    p = 0 * hl;
%end

end
