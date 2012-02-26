function [ index ] = get_index( t, X )
% This should return the index of the subinterval that contains t
index = 1;
for j = 1:size(X,2)
    if t < X(j)
        index = j-1;
        break;
    end
end
end

