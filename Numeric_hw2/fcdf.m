function [ va ] = fcdf( t, X, Y, H, S )
global Phi0 Phi1 Psi0 Psi1;

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
        va = Y(i) .* Phi0(z) + Y(i+1) .* Phi1(z) + S(i) .* H(i).* Psi0(z) + S(i+1) .* H(i) .* Psi1(z);
    end
end
end

% function [ dv1 ] = derive1( t, X, Y, H, S )
% %UNTITLED2 Summary of this function goes here
% %   Detailed explanation goes here
% if t < X(1) 
%     dv1 = S(1);
% else
%     if t > X(size(X,2)) 
%         dv1 = Y(size(X,2));
%     else
%         i = get_index(t,X);  
%         z = (t - X(i+1)) ./ H(i+1);
%         dv1 = ( Y(i+1) .* dPhi0(z) + Y(i+2) .* dPhi1(z) + S(i+1) .* H(i+1).* dPsi0(z) + S(i+2) .* H(i+1) .* dPsi1(z) ) ./ H(i+1);
%     end
% end
% end
% 
% function [ dv2 ] = derive2( t, X, Y, H, S )
% % evaluation of second derivative
% %   Detailed explanation goes here
% if t < X(1) 
%     dv2 = ( S(2) - S(1) ) ./ ( X(2) - X(1) );
% else
%     if t > X(size(X,2)) 
%         dv2 = ( S(size(X,2)) - S(size(X,2)-1) ) ./ ( X(size(X,2)) - X(size(X,2)-1) );
%     else
%         i = get_index(t,X);  
%         z = (t - X(i+1)) ./ H(i+1);
%         dv1 = ( Y(i+1) .* d2Phi0(z) + Y(i+2) .* d2Phi1(z) + S(i+1) .* H(i+1).* d2Psi0(z) + S(i+2) .* H(i+1) .* d2Psi1(z) ) ./ ( H(i+1) .* H(i+1) );
%     end
% end
% end
% 
% function [ index ] = get_index( t, X )
% % This should return the index of the subinterval that contains t
% index = 1;
% for j = 1:size(X,2)
%     if t >= X(j)
%         index = j;
%     end
% end
% end
% 
% function [ de1 ] = Deriv1( x )
% de1 = 1 ./ sqrt(2 .* pi) .* exp(-0.5 .* x .* x); 
% end
% 
% function [ de2 ] = Deriv2( x )
% de2 = -x ./ sqrt(2 .* pi) .* exp(-0.5 .* x .* x);
% end
% 
% %inline basis functions:
% function [ phi0 ] = Phi0( t )
% phi0 = t .*t .* (2 .* t - 3) + 1;
% end
% 
% function [ phi1 ] = Phi1( t )
% phi1 = Phi0(1 - t);
% end
% 
% function [ psi0 ] = Psi0( t )
% psi0 = t .* (t .* (t - 2) + 1); 
% end
% 
% function [ psi1 ] = Psi1( t )
% psi1 = -Psi0(1 - t); 
% end
% 
% %inline first derivatives of the basis functions:
% function [ dphi0 ] = dPhi0( t )
% dphi0 = 6 .* t .* (t-1); 
% end
% 
% function [ dphi1 ] = dPhi1( t )
% dphi1 = -dPhi0(1 - t); 
% end
% 
% function [ dpsi0 ] = dPsi0( t )
% dpsi0 = t .* (3 .* t-4)+1; 
% end
% 
% function [ dpsi1 ] = dPsi1( t )
% dpsi1 = dPsi0(1 - t); 
% end
% 
% %inline second derivatives of the basis functions:
% function [ d2phi0 ] = d2Phi0( t )
% d2phi0 = 12 .* t-6; 
% end
% 
% function [ d2phi1 ] = d2Phi1( t )
% d2phi1 = 6 - 12 .* t; 
% end
% 
% function [ d2psi0 ] = d2Psi0( t )
% d2psi0 = 6 .* t - 4; 
% end
% 
% function [ d2psi1 ] = d2Psi1( t )
% d2psi1 = 6 .* t - 2; 
% end

