function p = in_obstacle(x)
p = -1;

if ((x(1) + 0.4)^2 + (x(2) + 0.4)^2 - 0.2^2 < 0)
    p = 1;
end
if ((x(1) - 0.5)^2 + (x(2) + 0.2)^2 - 0.2^2 < 0)
    p = 1;
end
if ((x(1) - 0.4)^2 + (x(2) - 0.5)^2 - 0.2^2 < 0)
    p = 1;
end
if ((x(1) + 0.3)^2 + (x(2) - 0.6)^2 - 0.2^2 < 0)
    p = 1;
end

end
