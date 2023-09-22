function [value, isterminal, direction] = least_squares_event(t, u)

ll = 2;
Q = u(10:(10 + ll^2 - 1));
Q = reshape(Q, ll, []);

value = min(svd(Q)) - 1e00;
isterminal = 1;
direction = -1;

end
