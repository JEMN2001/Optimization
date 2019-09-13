function [Ib,In,b2] = CalcSol(c,A,b,Ib,In)
        B = A(:,Ib);
        N = A(:,In);
        Cb = c(:,Ib);
        Cn = c(:,In);
        Yn = inv(B)*N;
        Zn = Cb*Yn;
        Cn2 = Cn-Zn;
        b2 = inv(B)*b';
        while (ismember(1,(Cn2 < 0)))
            [ck,k] = min(Cn2); %Then Ik enters the base
            k = k(1);
            Yk = Yn(:,k);
            if (isequal((Yk <= 0),ones(1,length(Yk))))
                error("The problem has no finite optimal")
            end
            tmp = b2./Yk;
            for i = 1:length(tmp)
                if (tmp(i) < 0)
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
        end
end

