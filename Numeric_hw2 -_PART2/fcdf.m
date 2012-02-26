function [ va ] = fcdf( t, X, Y, H, S, M )
global Phi0 Phi1 Phihalf Psihalf;

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if t <= X(1) 
    va = Y(1);
else
    if t >= X(size(X,2)) 
        va = Y(size(X,2));
    else
        i = get_index(t,X);  
        z = (t - X(i)) ./ H(i);
        va = Y(i) .* Phi0(z) + Y(i+1) .* Phi1(z) + M(i) .* Phihalf(z) + S(i) .* H(i) .* Psihalf(z);
    end
end
end



