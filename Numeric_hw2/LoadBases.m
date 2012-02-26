global Phi0 Phi1 Psi0 Psi1 dPsi0 dPsi1 dPhi0 dPhi1 d2Phi0 d2Phi1 d2Psi0 d2Psi1;

Phi0 = @(t) 2*t.^3 - 3*t.^2 + 1;
Phi1 = @(t) -2*t.^3 + 3*t.^2;
Psi0 = @(t) t.^3 - 2*t.^2 + t;
Psi1 = @(t) t.^3 - t.^2;

dPsi0 = @(t) t .* (3 .* t-4)+1; 
dPsi1 = @(t) dPsi0(1 - t); 
dPhi0 = @(t) 6 .* t .* (t-1); 
dPhi1 = @(t) -dPhi0(1 - t); 

d2Phi0 = @(t) 12 .* t-6; 
d2Phi1 = @(t) 6 - 12 .* t; 
d2Psi0 = @(t) 6 .* t - 4; 
d2Psi1 = @(t) 6 .* t - 2; 
