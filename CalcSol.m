function [Ib,In,b2] = CalcSol(c,A,b,Ib,In,verbose,mini)
        B = A(:,Ib);
        N = A(:,In);
        Cb = c(:,Ib);
        Cn = c(:,In);
        Yn = inv(B)*N;
        Zn = Cb*Yn;
        Cn2 = Cn-Zn;
        b2 = inv(B)*b';

        if (mini == 0)
            condicion = ismember(1,(Cn2 > 0));
        else
            condicion = ismember(1,(Cn2 < 0));
        end
        n = 0;
        while (condicion)
            n=n+1;
            if (verbose)
                fprintf('Iteration # %d', n) ;
            end
            if (mini == 0)
                [ck,k] = max(Cn2); %Then Ik enters the base
            else
                [ck,k] = min(Cn2); %Then Ik enters the base
            end
            k = k(1);
            Yk = Yn(:,k);
            if (isequal((Yk <= 0),ones(length(Yk),1)))
                error("The problem has no finite optimal")
            end
            tmp = b2./Yk;
            for i = 1:length(tmp)
                if (Yk(i) <= 0)
                    tmp(i) = Inf;
                end
            end
            [ck2,r] = min(tmp); %Then Ir exits the base
            r = r(1);
            tmp = Ib(r);
            Ib(r) = In(k);
            In(k) = tmp;
            Ib = sort(Ib);
            In = sort(In);
            B = A(:,Ib);
            N = A(:,In);
            Cb = c(:,Ib);
            Cn = c(:,In);
            Yn = inv(B)*N;
            Zn = Cb*Yn;
            Cn2 = Cn-Zn;
            b2 = inv(B)*b';

            if(verbose)
                fprintf('\nIb =')
                disp(Ib)
                fprintf('\nIn =')
                disp(In)
                fprintf('\nb2 =')
                disp(b2)

            end 
            

            if (mini == 0)
                condicion = ismember(1,(Cn2 > 0));
            else
                condicion = ismember(1,(Cn2 < 0));
        end 
        end
end

