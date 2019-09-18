function [X,C] = Simplex(c,A,b,verbose,mini)
    % Finding size of matrix
    [m,n] = size(A);

    % Verifying that dimensions are correct
    Check_Dim(c,b,m,n);

    % Makes sure all the entries in b are positive
    times = ones(m,1);
    for i = 1:length(b)
        if b(i) < 0
            times(i) = -1;
            b(i) = b(i)*-1;
        end
    end
    A = A.*times;

    %-------------------Starting Phase 1------------------------

    A2 = [A,eye(m)]; % Original matrix adding artificial variables 
    c2 = [zeros(1,n),ones(1,m)]; % New cost vector for phase 1
    Ib = n+1:n+m; % Initial basic indexes for phase 1
    In = 1:n; % Initial non-basic indexes for phase 1

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

    % Calculate Solutions and Indexes for phase 1
    [Ib,In,b2] = CalcSol(c2,A2,b,Ib,In,verbose,1);

    %----------------Starting Phase 2-------------------------
    
    % Case 1: There are no artificial variables in the resulting Ib from phase 1
    if (max(Ib) < n+1)
        % We delete artificial variables
        In = In(1:n-m);
        
    % Case 2: There are artificial variables in the resulting Ib from phase 1
    else
        for i = 1:length(Ib)
            % Case 2 a) There is one artificial variable in Ib with value greater than 0.
            if (Ib(i) > n && b2(i) > 0)
                error ("The problem isn't feasible");
                
            % Case 2 a) There is no artificial variable in Ib with value greater than 0.
            elseif (Ib(i) > n)
                % We swap the artificial variable with value 0 with another non artificial variable from the non-basic indexes
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
        % We remove artificial variables
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
    
    % Calculate Solutions and Indexes for phase 2
    [Ib,In,b2] = CalcSol(c,A,b,Ib,In,verbose,mini);
    
    % We extend b2 with 0 for every non basic variable
    X = zeros(1,n);
    for i = 1:length(X)
        if (ismember(i,Ib))
            X(i) = b2(find(Ib==i));
        end
    end
    
    % We calculate the value of the cost function with the optimal values
    Cb = c(:,Ib);
    C = Cb*b2;
    
    % We print the results
    fprintf('\nThe solution for \n')
    fprintf('\nA = \n')
    disp(A)
    fprintf('\nc = \n ')
    disp(c)
    fprintf('\nb = \n')
    disp(b)
    fprintf('is    X =')
    disp(X)
    if (mini==0)
        fprintf('\nThe maximum value for the problem is %d \n', C)
    else
        fprintf('\nThe minimum value for the problem is %d \n', C)
    end
    fprintf('------------------------------------------------------- \n')
end