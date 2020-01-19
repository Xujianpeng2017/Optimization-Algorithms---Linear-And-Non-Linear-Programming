%% Fletcher Reeves
t = cputime;
X_init = [0,0]; 
func = funccc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
XX = Fletcher_Reeves(func,X_init)
e = cputime - t;
disp(e)
%% Marquardt
t = cputime;
X_init = [0,0]; 
func = funccc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
X = Marquardt(func,X_init, 10000, 0.25, 2, 0.01)
e = cputime - t;
disp(e)
%% Fletcher Reeves 4D
t = cputime;
X_init = [0,2,0,1]; 
func = funcc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
X = FRfourD(func,X_init)
e = cputime - t;
disp(e)
%% Marquardt 4D
t = cputime;
X_init = [0,2,0,1]; 
func = funcc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
X = MarqrdtfourD(func,X_init, 10000, 0.25, 2, 0.01)
e = cputime - t;
disp(e)
%% Fibonacci
t = cputime;
a = 0; b =3 ; n =6; % I tried other examples n = 7,5,4,3 , (b = 50 and n =11), to test the function well for large n enlarge the interval (b = 500, n = 14, fibonacci(14) = 610!), (b = 20 or 36, n = 8)
[X1,X2] = fibonacci_search(@f,a,b,n)
e = cputime - t;
disp(e)
%% Golden-Section
t = cputime;
a = 0; b =3 ; n =6; % I tried other examples n = 7,5,4,3 , (b = 50 and n =11), to test the function well for large n enlarge the interval (b = 500, n = 14, fibonacci(14) = 610!), (b = 20 or 36, n = 8)
[X1,X2] = golden_search(@f,a,b,n)
e = cputime - t;
disp(e)
%% Quadratic Interpolation
t = cputime;
[lambda_star,f_lmda_star,h_lmda_star] = Quadratic_interpolation(@f,0.5, 0)
e = cputime - t;
disp(e)
%% Cubic Interpolation - The TA told us2 iterations are enough
t = cputime;
[lambda_star,f_lmda_star,h_lmda_star] = Cubic_interpolation(ff,0.5, 0)
e = cputime - t;
disp(e)
%% Quasi Newton 2 D rank 2 update ( I only implemented rank 1 using full newton step length lmdastar = 1)
clc
clear
t = cputime;
X_init = [-1.2,1]; 
func = funccc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
[X,f] = QuasiNewton2d(func,X_init, 10)
e = cputime - t;
disp(e)
%% Quasi Newton 4 D rank 2 update ( I only implemented rank 1 using full newton step length lmdastar = 1)
t = cputime;
X_init = [0,0,0,1]; 
func = funcc();            % This is the example from the text book, it's working perfectly. If you want to change the testing function, change the funccc function provided!
X = QuasiNewton4D(func,X_init,5)
e = cputime - t;
disp(e)
