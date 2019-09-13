function [out] = Simplex(c,A,b,verbose,min)
    [m,n] = size(A);
    Check_Dim(c,A,b,m,n);
    A2 = [A,eye(m)];
    c2 = [zeros(1,n),ones(1,m)];
    Ib = n+1:n+m;
    In = 1:n;
    [C,Y] = CalcCost(c2,A2,Ib,In); 
    b2 = inv(B)*b;
    while (ismember(1,(C < 0)))
        [ck,k] = min(C);
        if (isequal((Y <= 0),ones(1,lenght(Y))))
            error("The problem has no finite optimal")
        end
        for i = Y
        end
    end
end