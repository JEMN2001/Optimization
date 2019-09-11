function [out] = Simplex(c,A,b,verbose,min)
    [m,n] = size(A);
    Check_Dim(c,A,b,m,n);
    A2 = [A,eye(m)];
    c2 = [zeros(1,n),ones(1,m)];
    Phase1(c2,A2,b,m,n);
end