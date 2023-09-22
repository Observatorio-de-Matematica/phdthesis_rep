function dstate = RPobserver(t, tdist, dist, state, Ae, Be, gamma, M, lam)
    n = 3;

    z = state(1:n);
    hx = state(n+1: 2*n);
    hy = hx(1);
    hx2 = state(2*n + 1: 3*n);
    hlam = state(3*n + 1: end);
       
    y = z(2) + delta(t,tdist,dist);
    
    H = [0; 0; 1];
    
    dz = [-z(2) - z(3);
        z(1);
        lam(1)*(z(2) - z(2)^2) - lam(2)*z(3)];
    
    dhx = Ae*hx + Be*y + H*(hlam'*Phi(hx) + forcing(hx));
    dhx2 = Ae*hx2 + Be*y;
    
    if norm(hlam)^2 < M || (hy - y)*hlam'*Phi(hx) >= 0
        dlamb = -gamma*(hy - y)*Phi(hx);
    else
        dlamb = zeros(length(hlam),1);
    end
    
    dstate = [dz; dhx; dhx2; dlamb];
end