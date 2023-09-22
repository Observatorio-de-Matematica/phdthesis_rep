function dstate = RPUKF(t,tdist, dist, state, lam, a, b, k, R, Q)
    
n = 3;
N = 5;

z = state(1:n);
m = state(n+1:n+N);
P = state(n+N+1:n+N+N^2);

P = reshape(P, [N,N]);

y = z(2)+delta(t,tdist,dist);

dz = [-z(2) - z(3);
    z(1);
    lam(1)*(z(2) - z(2)^2) - lam(2)*z(3)];

sqP = sqrtm(P);

c = a^2*(N+k);
l = a^2*(N+k) - N;

Wm = [l/(N+l); repmat(1/(2*(N+l)), 2*N, 1)];
Wc = [l/(N+l) + (1-a^2+b); repmat(1/(2*(N+l)), 2*N, 1)];
W = (eye(2*N+1) - repmat(Wm,1,2*N+1))*diag(Wc)*(eye(2*N+1) - repmat(Wm,1,2*N+1))';

X = repmat(m,1,2*N+1) + sqrt(c)*[zeros(N,1), sqP, -sqP];
Y = X(1,:);

K = X*W*Y'/R;

fm = [m(2);m(3);(-1).*m(2)+(-1).*(m(1)+(-1).*m(1).^2).*m(4)+((-1).*m(1)+(-1).*m(3)).*m(5);0;0];
ym = m(1);

dm = fm + K*(y - ym);

f = [X(2,:);X(3,:);(-1).*X(2,:)+(-1).*(X(1,:)+(-1).*X(1,:).^2).*X(4,:)+((-1).*X(1,:)+(-1).*X(3,:)).*X(5,:);zeros(1,2*N+1);zeros(1,2*N+1)];

dP = X*W*f' + f*W*X' + Q - K*R*K';

dstate = [dz; dm; dP(:)];