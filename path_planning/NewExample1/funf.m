function f = funf(x)

x_1 = x(1);
x_2 = x(2);
p = (x_1-1)^2 + x_2^2 - 1/4;

f = [-(x_1-1)*p;
    -x_2*p];