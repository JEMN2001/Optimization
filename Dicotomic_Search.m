function [a,b] = Dicotomic_Search(f,I,e)
    p = 1;
    while(p == 1)
        if (I(2)-I(1) <= e)
            a = I(1);
            b = I(2);
            p = 2;
        else
            lam = ((I(1)+I(2))/2)-0.1*e;
            mu = ((I(1)+I(2))/2)+0.1*e;
        end
        if (p == 1 && f(lam) < f(mu))
            I(2) = mu;
        elseif (p == 1)
            I(1) = lam;
        end
    end
end

