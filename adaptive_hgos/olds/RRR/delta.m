function d = delta(t,tdist,dist)
d = interp1(tdist,dist,t, 'nearest'); %0.1*(sin(0.1*pi*t) + cos(0.1*sqrt(2)*t));
end
