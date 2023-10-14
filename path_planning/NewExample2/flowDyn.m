function dxtot = flowDyn(xtot,R,alpha1)

x = xtot(1:2);
w1 = xtot(3:end);

dphi = gradBasis(x);
f = funf(x);
g = fung(x);
q = funq(x);

u = -1/2*(R\g')*dphi'*w1;

sigma = dphi*(f + g*u);

dx = f + g*u;
dw1 = -alpha1*sigma/(sigma'*sigma + 1)^2*(sigma'*w1 + q + u'*R*u);

dxtot = [dx; dw1];