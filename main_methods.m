e = 0.01;

f = @(x) (x(1)-2)^4+(x(1)-2*x(2))^2;
Gf = @(x) [4*(x(1)-2)^3+2*(x(1)-2*x(2)),-4*(x(1)-2*x(2))];
Xs = Gradient_Method(f,[0,3],Gf,e,1);
Xs

f = @(x) x(1)^2+x(2)^2;
Gf = @(x) [2*x(1),2*x(2)];
Xs = Gradient_Method(f,[1,1],Gf,e,1);
Xs