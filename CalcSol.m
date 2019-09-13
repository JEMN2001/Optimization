function Index = CalcSol(c,A,b,Ib,In)
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
            if (isequal((Yn <= 0),ones(1,lenght(Yn))))
                error("The problem has no finite optimal")
            end
            tmp = b2./Yn;
            for i = 1:length(tmp);
                if (tmp(i) < 0)
                    tmp(i) = max(tmp)+1;
                end
            end
            [ck2,r] = min(tmp); %Then Ir exits the base
            swap(Ib(k),In(r));
            B = A(:,Ib);
            N = A(:,In);
            Cb = c(:,Ib);
            Cn = c(:,In);
            Yn = inv(B)*N;
            Zn = Cb*Y;
            Cn2 = Cn-Zn;
            b2 = inv(B)*b';
        end
        Index = [Ib,In];
end

