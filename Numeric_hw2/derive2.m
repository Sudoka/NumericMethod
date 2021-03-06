function [ dv2 ] = derive2( t, X, Y, H, S )
global d2Phi0 d2Phi1 d2Psi0 d2Psi1;
% evaluation of second derivative
%   Detailed explanation goes here
if t < X(1) 
    dv2 = ( S(2) - S(1) ) ./ ( X(2) - X(1) );
else
    if t > X(size(X,2)) 
        dv2 = ( S(size(X,2)) - S(size(X,2)-1) ) ./ ( X(size(X,2)) - X(size(X,2)-1) );
    else
        i = get_index(t,X);  
        z = (t - X(i)) ./ H(i);
        dv2 = ( Y(i) .* d2Phi0(z) + Y(i+1) .* d2Phi1(z) + S(i) .* H(i).* d2Psi0(z) + S(i+1) .* H(i) .* d2Psi1(z) ) ./ ( H(i) .* H(i) );
    end
end
end
