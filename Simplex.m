function [Ib,In,b2] = Simplex(c,A,b,verbose,min)
    [m,n] = size(A);
    Check_Dim(c,b,m,n);
    %Fase 1
    A2 = [A,eye(m)];
    c2 = [zeros(1,n),ones(1,m)];
    Ib = n+1:n+m;
    In = 1:n;
    [Ib,In,b2] = CalcSol(c2,A2,b,Ib,In);
    %Fase 2
    if (max(Ib) < n+1)
        In = In(1:n-m);
    end
    [Ib,In,b2] = CalcSol(c,A,b,Ib,In);
end