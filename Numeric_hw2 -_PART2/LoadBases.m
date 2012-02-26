global Phi0 Phi1 Phihalf Psihalf dPhihalf dPsihalf dPhi0 dPhi1 d2Phi0 d2Phi1 d2Phihalf d2Psihalf;

Phi0 = @(t) -4 .* t.^3 + 8 .* t.^2 - 5 .* t + 1;
Phi1 = @(t) 4 .* t.^3 - 4 .* t.^2 + t;
Phihalf = @(t) - 4 .* t.^2 + 4 .* t;
Psihalf = @(t) -4 .* t.^3 + 6 .* t.^2 - 2 .* t;

dPhi0 = @(t) -12 .* t.^2 + 16 .* t - 5; 
dPhi1 = @(t) 12 .* t.^2 - 8 .* t + 1; 
dPhihalf = @(t) -8 .* t + 4; 
dPsihalf = @(t) -12 .* t.^2 + 12 .* t - 2; 

d2Phi0 = @(t) -24 .* t + 16; 
d2Phi1 = @(t) 24 .* t - 8; 
d2Phihalf = @(t) -8; 
d2Psihalf = @(t) -24 .* t + 12; 
