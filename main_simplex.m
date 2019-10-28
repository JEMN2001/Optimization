% ------------------------------- Tarea 1 --------------------------------
% ----------------------------- Optimization -----------------------------
% ------------------- Juan Esteban Murcia y Juanita Gomez----------------- 

%------------------------------------------------------------------------%

% Exercise 1
c = [2 1 0 0 0];
A = [1,1,1,0,0; 1,0,0,1,0;0,1,0,0,1];
b = [9 5 7];
mini = 0;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);

% Solution is:
% X= [5 4 0 0 3]
% C= 14

%------------------------------------------------------------------------%

% Exercise 2
c = [1 1 0 0 ];
A = [1,2,1,0; 0,1,0,1];
b = [4 1];
mini = 1;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);

% Solution is:
% X= [0 0 4 1]
% C= 0

%------------------------------------------------------------------------%

% Exercise 3
c = [-2 -4 0 0];
A = [1,2,1,0; -1,1,0,1];
b = [4 1];
mini = 1;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);

% Solution is:
% X= [2/3 5/3 0 0]
% C= -8

%------------------------------------------------------------------------%

% Exercise 4
c = [5 -1 0 0];
A = [-1,2,-1,0; 1,1,0,1];
b = [2 6];
mini = 1;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);

% Solution is:
% X= [0 6 10 0]
% C= -6

%-----------------------------------------------------------------------%

% Exercise 5
c = [2 3 4 0 0 0];
A = [3,2,1,1,0,0; 2,3,3,0,1,0; 1,1,-1,0,0,-1];
b = [10 15 4];
mini = 0;
verbose = 0;
[X,C] = Simplex(c,A,b,verbose,mini);

% Solution is:
% X= [1/3 38/9 5/9 0 0 0]
% C= 140/9

%-----------------------------------------------------------------------%

% Exercise 6
c = [5 -1 0 0];
A = [-1,2,1,0; -1,1,0,-1];
b = [2 3];
mini = 1;
verbose = 0;
%[X,C] = Simplex(c,A,b,verbose,mini);

% This problem isn't feasible (The program displays error and stops running)


%------------------------------------------------------------------------%

% Exercise 7
c = [-1 -3 0 0];
A = [1,-2,1,0; -1,1,0,1];
b = [4 3];
mini = 1;
verbose = 0;
%[X,C] = Simplex(c,A,b,verbose,mini);

% This problem has no finite optimal (The program displays error and stops running)

%------------------------------------------------------------------------%

% Exercise 8
c = [-1 -3 0 0 1];
A = [1,-2,1,0; -1,1,0,1];
b = [4 3];
mini = 1;
verbose = 0;
% [X,C] = Simplex(c,A,b,verbose,mini);

% This problem has more costs than variables so it should not work (The program displays error and stops running)







