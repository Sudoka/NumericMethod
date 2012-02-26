function [ dv1 ] = derive1( t, X, Y, H, S )
global dPsi0 dPsi1 dPhi0 dPhi1;
if t < X(1) 
    dv1 = S(1);
else
    if t > X(size(X,2)) 
        dv1 = Y(size(X,2));
    else
        i = get_index(t,X);  
        z = (t - X(i)) ./ H(i);
        dv1 = ( Y(i) .* dPhi0(z) + Y(i+1) .* dPhi1(z) + S(i) .* H(i).* dPsi0(z) + S(i+1) .* H(i) .* dPsi1(z) ) ./ H(i);
    end
end
end

