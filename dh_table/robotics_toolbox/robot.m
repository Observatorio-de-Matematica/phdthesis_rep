[robot, data] = loadrobot('quanserQArm');
iviz = interactiveRigidBodyTree(robot);

iviz.Configuration = [0; 0; 0; 0];
iviz.MarkerBodyName = 'END-EFFECTOR';
measured_poses = [];
for t = 0:0.01:10
    iviz.Configuration = [
        max(deg2rad(-170), min(cos(t), deg2rad(170)));
        max(deg2rad(-85), min(sin(2 * t), deg2rad(85)));
        max(deg2rad(-95), min(0.5 * cos(3 * t), deg2rad(75)));
        max(deg2rad(-160), min(sin(t), deg2rad(160)));
    ];
    measured_poses = [measured_poses, iviz.MarkerBodyPose(1:3, 4)];
end
csvwrite("quanserQArm.csv", measured_poses')
