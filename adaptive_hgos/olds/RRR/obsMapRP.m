function x = obsMapRP(z)
    x = [z(:, 2), z(:,1), -z(:,2) - z(:,3)];
end