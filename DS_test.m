f = @(x) x^2;
I = [-10,5];
e = 0.01;
[a,b] = Dicotomic_Search(f,I,e)
(b+a)/2