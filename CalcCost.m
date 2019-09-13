function X = CalcCost(c,A,Ib,In)
        B = A(:,Ib);
        N = A(:,In);
        Cb = c(:,Ib);
        Cn = c(:,In);
        Yn = inv(B)*N;
        Zn = Cb*Y;
        Cn2 = Cn-Zn;
        X = [Cn2,Yn];
end

