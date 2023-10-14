function f = funf(x)

x_1 = x(1);
x_2 = x(2);

p = x_1.^4+x_2.^4-2/3;

f = 1e2*[-x_1^3*p;
    -x_2^3*p];