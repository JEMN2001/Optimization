function x = Gradient_Method(f,x0,Gf,e,verbose)
    x = x0;
    Ge = Gf(x);
    while (sqrt(Ge*Ge') > e)
        d = -Ge;
        fl = @(l) f(x+l*d);
        lam = Dicotomic_Search(fl,[0,100],e);
        x = x+lam*d;
        Ge = Gf(x);
        if (verbose)
            fprintf("-----------------------------\n");
            fprintf("Actual point:\n");
            disp(x-lam*d);
            fprintf("Direction:\n");
            disp(d);
            fprintf("Step size:\n");
            disp(lam);
            fprintf("New point:\n");
            disp(x);
            fprintf("-----------------------------\n");
        end
    end
end