close all

load w10.mat

N = 1;
initial_positions = generate_initial_conditions(N, 'Spacing', 0.5);
final_goal_points = [ ...
    -0.8; -0.6;  0.;
];
L = 0.2;
starting_point = final_goal_points(1:2);

r = Robotarium('NumberOfRobots', N, 'ShowFigure', true, ...
            'InitialConditions', initial_positions);


% We'll make the rotation error huge so that the initialization checker
% doesn't care about it
args = {'PositionError', 0.02, 'RotationError', 50};
init_checker = create_is_initialized(args{:});

position_control = create_si_position_controller();
si_barrier_certificate = create_si_barrier_certificate_with_boundary();
si_to_uni_dyn = create_si_to_uni_dynamics_with_backwards_motion();

% Get initial location data for while loop condition.
x = r.get_poses();
r.step();

% posiziono l'uniciclo in un punto "sensato" (modifica final_goal_points)
while (~init_checker(x, final_goal_points))
    x = r.get_poses();
  
    % Use a single-integrator position controller to drive the agents to
    % the circular formation
    dx = position_control(x(1:2,:), final_goal_points(1:2,:));
    dx = si_barrier_certificate(dx, x);
    dx = si_to_uni_dyn(dx, x);

    r.set_velocities(1:N, dx);
    r.step();   
end

% condizione iniziale per theta scelta come atan2(f_2(x(0)), f_1(x(0)))
dphi = gradBasis(x(1:2));
f = funf(x(1:2));
g = fung(x(1:2));
R = 1;
u = -1/2*(R\g')*dphi'*w10;
ell = f + g*u;
thetaDes = double(atan2(ell(2), ell(1)));
kv1 = 1;
kv2 = 1;
while abs(x(3) - thetaDes) > 0.01
    x = r.get_poses();

    v1 = kv1 * ((starting_point(1) - x(1)) * cos(x(3)) + ...
        (starting_point(2) - x(2)) * sin(x(3)));
    v2 = kv2 * (thetaDes - x(3));

    if abs(v1) > 1
        v1 = sign(v1) * 1;
    end
    if abs(v2) > 1
        v2 = sign(v2) * 1;
    end

    dx = [v1; v2;];
    dx = [zeros(2, N - 1), dx];
    %dx = si_barrier_certificate(dx, x);
    r.set_velocities(1:N, dx);
    r.step();
end

[xx, yy] = meshgrid(-1.6:0.01:1.6, -1.6:0.01:1.6);
z1 = (-1/4)+((-1)+xx).^2+yy.^2;
z2 = (-1/9)+(0.1E0+xx).^2+((-0.5E0)+yy).^2;
z3 = (-1/9)+(0.1E0+xx).^2+(0.5E0+yy).^2;
[c1,h1] = contour(xx,yy,z1,[0,0]);
[c2,h2] = contour(xx,yy,z2,[0,0]);
[c3,h3] = contour(xx,yy,z3,[0,0]);
plot(c1(1,2:end),c1(2,2:end),'k--')
hold on
fill(c2(1,2:end),c2(2,2:end),'r')
fill(c3(1,2:end),c3(2,2:end),'r')

v1 = 0;
v2 = 0;
param = 1e-1;
while norm((x(1)-1)^2 + x(2)^2 - 1/4) > 1e-2
    x = r.get_poses();
    disp(x')

    dphi = gradBasis(x);
    f = funf(x);
    g = fung(x);
    u = -1/2*(R\g')*dphi'*w10;
    ell = f + g*u;
    
    dx = [cos(x(3)), sin(x(3)); -1/L*sin(x(3)), 1/L*cos(x(3))]*ell;
    
    thr_lin = 1/2*r.max_linear_velocity;
    thr_ang = 1/2*r.max_angular_velocity;
    scaleFactor = min([thr_lin/max(abs(dx(1,:))), ...
        thr_ang/max(abs(dx(2,:)))]);
    dx = dx*scaleFactor;

    r.set_velocities(1:N, dx);
    r.step();
end

% We can call this function to debug our experiment!  Fix all the errors
% before submitting to maximize the chance that your experiment runs
% successfully.
r.debug();
