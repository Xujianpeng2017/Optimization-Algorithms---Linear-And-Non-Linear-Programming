%% This section is to run fixed Step Length
A = [1,2,4,5;1,4,6,7;3,8,5,11];
y = [2,3,5]';
x = [1,3,5,6]';
c = [3,4,6,7]';
b = [1,6,8]';
s = [0.3,0.5,0.4,0.2]';
[XX,SS,YY,R]=Central_path(y,A,b,c,0.3,x,s)
%% This is the script to run section II of Mehrotra 
m = 3;
n = 4;
A = [1,2,4,5;1,4,6,7;3,8,5,11];
c = [3,4,6,7]';
b = [1,6,8]';
[f, x, y, s, N] = Mehrotra(A, b, c);
%% Central Path with adaptive step size
A = [1,2,4,5;1,4,6,7;3,8,5,11];
y = [2,3,5]';
x = [1,3,5,6]';
c = [3,4,6,7]';
b = [1,6,8]';
s = [0.3,0.5,0.4,0.2]';
[XX,SS,YY,R]=Central_path2(y,A,b,c,0.3,x,s) 
%% This section is to run fixed Step Length - Caase Study 2
% random initializtions, you can use this cell for general for infinite
% case studies just re-run the code
m = 3;
n = 4;
A = randn(m,n)
y = [6,7,9]';
x = [6,1,0,8]';
c = [2,1,5,9]';
b = [3,8,4]';
s = [0.2,0.42,0.31,0.28]';
[XX,SS,YY,R]=Central_path(y,A,b,c,0.3,x,s)
%% This is the script to run section II of Mehrotra length - Case Study 2
m = 3;
n = 4;
A = [1,-2,1,8;9,2,9,11;2,-6,11,17];
c = [2,1,5,9]';
b = [3,8,4]';
[f, x, y, s, N] = Mehrotra(A, b, c);
%% Central Path with adaptive step size - Case Study 2
A = [1,-2,1,8;9,2,9,11;2,-6,11,17];
y = [2,1,3]';
x = [4,4,2,6]';
c = [2,1,5,9]';
b = [3,8,4]';
s = [0.1,0.4,0.31,0.28]';
[XX,SS,YY,R]=Central_path2(y,A,b,c,0.3,x,s) 
%% This section is to run fixed Step Length - Case Study 3
A = [6,1,-4,10;10,-6,8,2;2,10,7,-1];
y = [-7,8,4]';
x = [3,3,5,7]';
c = [1,2,7,4]';
b = [9,8,4]';
s = [0.7,0.48,0.21,0.13]';
[XX,SS,YY,R]=Central_path(y,A,b,c,0.3,x,s)
%% This is the script to run section II of Mehrotra length
m = 3;
n = 4;
A = [6,1,-4,10;10,-6,8,2;2,10,7,-1];
c = [1,2,7,4]';
b = [9,8,4]';
[f, x, y, s, N] = Mehrotra(A, b, c);
%% Central Path with adaptive step size
A = [6,1,-4,10;10,-6,8,2;2,10,7,-1];
y = [-7,8,4]';
x = [3,3,5,7]';
c = [1,2,7,4]';
b = [9,8,4]';
s = [0.7,0.48,0.21,0.13]';
[XX,SS,YY,R]=Central_path2(y,A,b,c,0.3,x,s) 