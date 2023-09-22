function [phi, x0, lambda, phi0, z0] = get_sys_info(x)

%phi = [- x(1) + x(1)^2; x(1) + x(3); x(2)];
%lambda = [0.5; -0.5; -1];
%x0 = [0.1, 0.1, 0.1];

%phi = [x(1); x(2); x(3)];
%lambda = [-4; -4; -1];
%x0 = [-5, 5, 0.9];

%phi = [x(3); x(2)^2; x(1)];
%lambda = [-2.02; 1; -1];
%x0 = [5, 2, 0];

phi = [x(3); x(1); x(1) * x(2); 1];
lambda = [-1.8; -2; 1; -1];
x0 = [-5, 5, 0.9];

z0 = 0;
phi0 = 0;

end
