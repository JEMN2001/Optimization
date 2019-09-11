function [sol,Ib] = Phase1(c,A,b,n,m)
        Ib = n+1:n+m;
        In = 1:n;
        B = A(:,Ib);
        N = A(:,In);
        Bi = inv(B);
        Xb = Bi*b;
        Cb = c(:,Ib);
        Cn = c(:,In);
        Yn = Bi*N;
        Zn = Cb*Y;
        Cn2 = Cn-Zn;
        while (ismember(1,(Cn2 < 0)))
            [c0,k] = min(Cn2);
            yk = Yn[k];
            if (yk <= 0)
                error ("No tiene optimo finito");
            end
        end
end

