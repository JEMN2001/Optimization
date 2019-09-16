c = [2 1 0 0 0];
A = [1,1,1,0,0; 1,0,0,1,0;0,1,0,0,1];
b = [9 5 7];
mini = 1;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);
fprintf('\nThe solution for \n')
fprintf('\nA = \n')
disp(A)
fprintf('\nc = \n ')
disp(c)
fprintf('\nb = \n')
disp(b)
fprintf('is    X =')
disp(X)
if (mini==0)
    fprintf('\nThe maximum value for the problem is %d \n', C)
else
    fprintf('\nThe minimum value for the problem is %d \n', C)
end


