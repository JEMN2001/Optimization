function [X,C] = Simplex(c,A,b,verbose,mini)
    %Finding size of matrix
    [m,n] = size(A);

    %Verifying that dimensions are correct
    Check_Dim(c,b,m,n);

    % ???
    times = ones(m,1);
    for i = 1:length(b)
        if b(i) < 0
            times(i) = -1;
            b(i) = b(i)*-1;
        end
    end
    A = A.*times;

    % Starting Phase 1

    A2 = [A,eye(m)]; % Original matrix adding artificial variables 
    c2 = [zeros(1,n),ones(1,m)];
    Ib = n+1:n+m; 
    In = 1:n;

    if (verbose)
        fprintf('\nThis is the beginning of Phase 1')
        fprintf('\nA = \n')
        disp(A2)
        fprintf('\nc2 = \n ')
        disp(c2)
        fprintf('\nBasic Indexes (Ib) = \n')
        disp(Ib)
        fprintf('\nNon Basic Indexes (In) = \n')
        disp(In)
    end


    [Ib,In,b2] = CalcSol(c2,A2,b,Ib,In,verbose,1);

    %Starting Phase 2


    if (max(Ib) < n+1)
        In = In(1:n-m);
    else
        for i = 1:length(Ib)
            if (Ib(i) > n && b2(i) > 0)
                error ("The problem isn't faesable");
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
    if (verbose)
        fprintf('\nThis is the beginning of Phase 2 \n')
        fprintf('\nA = \n')
        disp(A)
        fprintf('\nc = \n ')
        disp(c)
        fprintf('\nBasic Indexes (Ib) = \n')
        disp(Ib)
        fprintf('\nNon Basic Indexes (In) = \n')
        disp(In)
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