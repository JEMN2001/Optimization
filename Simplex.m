function [X,C] = Simplex(c,A,b,verbose,mini)
    [m,n] = size(A);
    Check_Dim(c,b,m,n);
    times = ones(m,1);
    for i = 1:length(b)
        if b(i) < 0
            times(i) = -1;
            b(i) = b(i)*-1;
        end
    end
    A = A.*times;
    %Fase 1
    A2 = [A,eye(m)];
    c2 = [zeros(1,n),ones(1,m)];
    Ib = n+1:n+m;
    In = 1:n;
    [Ib,In,b2] = CalcSol(c2,A2,b,Ib,In,verbose,1);
    %Fase 2
    if (max(Ib) < n+1)
        In = In(1:n-m);
    else
        for i = 1:length(Ib)
            if (Ib(i) > n && b2(i) > 0)
                error ("El problema no es factible");
            elseif (Ib(i) > n)
                for j = 1:length(In)
                    if In(j) < n+1
                        tmp = In(j);
                        In(j) = Ib(i);
                        Ib(i) = tmp;
                        break;
                    end
                end
            end
        end
        Ib = sort(Ib);
        In = sort(In);
        In=In(1:n-m);
    end
    [Ib,In,b2] = CalcSol(c,A,b,Ib,In,verbose,mini);
    X = zeros(1,n);
    for i = 1:length(X)
        if (ismember(i,Ib))
            X(i) = b2(find(Ib==i));
        end
    end
    Cb = c(:,Ib);
    C = Cb*b2;
end