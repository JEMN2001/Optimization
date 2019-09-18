function [Ib,In,b2] = CalcSol(c,A,b,Ib,In,verbose,mini)
        B = A(:,Ib);  % Basic Matrix 
        N = A(:,In);  % Non Basic Matrix
        Cb = c(:,Ib); % Vector for costs corresponding to basic indexes
        Cn = c(:,In); % Vector for costs corresponding to non-basic indexes
        Yn = inv(B)*N; 
        Zn = Cb*Yn; 
        Cn2 = Cn-Zn;  % Reduced costs
        b2 = inv(B)*b'; 
        % Checks whether the problem is to maximize or minimize
        if (mini == 0)
            condicion = ismember(1,(Cn2 > 0));
        else
            condicion = ismember(1,(Cn2 < 0));
        end
        % Initialize number of iterations
        count = 0;
        while (condicion)
            count=count+1;
            if (verbose)
                fprintf('Iteration # %d', count) ;
            end
            if (mini == 0)
                [ck,k] = max(Cn2); %Then Ik enters the base
            else
                [ck,k] = min(Cn2); %Then Ik enters the base
            end
            k = k(1); % In case that there are several minimums or maximums, we take the first one.
            Yk = Yn(:,k); % Takes the k-column of Yn
            
            % If all the entries of Yk are negative, the problem has no finite optimal
            if (isequal((Yk <= 0),ones(length(Yk),1)))
                error("The problem has no finite optimal")
            end
            % Vector of ratios between b2 and Yk
            tmp = b2./Yk;
            
            % If one entry of yk is negative we set its corresponding entry in tmp to infinite because we only want
            % to consider the minimum between the positive yk's.
            for i = 1:length(tmp)
                if (Yk(i) <= 0)
                    tmp(i) = Inf;
                end
            end
            [ck2,r] = min(tmp); % r is the index in Ib of the variable that exits the base 
            r = r(1); % In case that there are several minimums, we take the first one
            
            % We swap the r-th entry of Ib with the k-th entry of In
            tmp2 = Ib(r);
            Ib(r) = In(k);
            In(k) = tmp2;
            % We order the indexes
            Ib = sort(Ib);
            In = sort(In);
            
            % We calculate again B, N, Cb and Cn using the new basic
            % indexes
            B = A(:,Ib);
            N = A(:,In);
            Cb = c(:,Ib);
            Cn = c(:,In);
            Yn = inv(B)*N;
            Zn = Cb*Yn;
            Cn2 = Cn-Zn; % New reduced costs
            b2 = inv(B)*b'; 

            if(verbose)
                [m,n] = size(A);
                X = zeros(1,n);
                Y = zeros(1,n);
                for i = 1:length(X)
                    if (ismember(i,Ib))
                        X(i) = b2(find(Ib==i));
                        Y(i) = Yk(find(Ib==i));
                    end
                end
                fprintf('\nIb = \n')
                disp(Ib)
                fprintf('\nepsilon = \n')
                disp(ck2)
                fprintf('\nyk = \n')
                disp(Y)
                fprintf('\nX  = \n')
                disp(X)
            end 
            
            % We update the value of the condition to see if we need more
            % iterations.
            if (mini == 0)
                condicion = ismember(1,(Cn2 > 0));
            else
                condicion = ismember(1,(Cn2 < 0));
            end
        end
        if (verbose)
            fprintf('------------------------------------------------------- \n')
        end
end

