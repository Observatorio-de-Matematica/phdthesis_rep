function [phi, x0, lambda, phi0, z0] = get_sys_info(x)

phi = [- x(1) + x(1)^2; x(1) + x(3)];
lambda = [0.5; -0.5];
x0 = [0.3, 0.1, -0.3];
z0 = [0.1, 0.3, 0.0];

phi0 = - x(2);

end
