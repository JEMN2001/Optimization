function [out] = Simplex(c,A,b,verbose,min)
    [m,n] = size(A);
    %Checks if there is the same number of costs as variables, if not, throws error
    if (size(c) ~= n)
        error('The length of c and A are not the same!');
    %Check if there is the same number of restrictions as elements in b, if not, throws error
    elseif (m ~= size(b))
        error('The length of b and A are not the same!');
    end
    
    
end

