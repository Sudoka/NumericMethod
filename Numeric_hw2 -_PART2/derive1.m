function [ dv1 ] = derive1( t, X, Y, H, S, M )
global dPhihalf dPsihalf dPhi0 dPhi1;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if t <= X(1) 
    dv1 = S(1);
else
    if t >= X(size(X,2)) 
        dv1 = S(size(X,2)-1);
    else
        i = get_index(t,X);  
        z = (t - X(i)) ./ H(i);
        dv1 = ( Y(i) .* dPhi0(z) + Y(i+1) .* dPhi1(z) + M(i) .* dPhihalf(z) + S(i) .* H(i) .* dPsihalf(z) ) ./ H(i);
    end
end
end

