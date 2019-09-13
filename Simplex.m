function Index = Simplex(c,A,b,verbose,min)
    [m,n] = size(A);
    Check_Dim(c,b,m,n);
    A2 = [A,eye(m)];
    c2 = [zeros(1,n),ones(1,m)];
    Ib = n+1:n+m;
    In = 1:n;
    Index = CalcSol(c2,A2,b,Ib,In);
end