function d = disturbance(t, tdist, dist)
d = interp1(tdist, dist, t, 'nearest');
end
