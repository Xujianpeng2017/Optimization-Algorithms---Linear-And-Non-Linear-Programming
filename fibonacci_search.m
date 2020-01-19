function [var1,var2] = fibonacci_search(fhandle,a,b,n)
nums = [1:n+1];
fibonacci_sequence = fibonacci(nums);
interval = b-a;
fibonacci_sequence(1) = [];
ratio = (fibonacci_sequence(n-2)/fibonacci_sequence(n))*(b-a);
if ratio < interval / 2
    X_2 = b-ratio;X_1 = a+ratio;
else
    X_1 = b-ratio;X_2 = a+ratio;
end
count = 2;
f_1 = fhandle(X_1);f_2 = fhandle(X_2);
if f_1 < f_2
    X_middle = X_1;f_middle = fhandle(X_1);
end
if f_1 > f_2
    X_middle = X_2;f_middle = fhandle(X_2);
end
X_new = X_2 - X_1;
for i = count:n
    f_new = fhandle(X_new);
    if X_new < X_middle
        if f_new < f_middle
            b = X_middle; X_middle = X_new; f_middle = f_new;
            %plot(X_new,f_new,'rx');
        else 
            a = X_new; X_middle = X_middle; f_middle = f_middle;
            %plot(X_middle,f_middle,'rx');
        end
    else 
        if f_new < f_middle
            a = X_middle; X_middle = X_new; f_middle = f_new;
            %plot(X_new,f_new,'rx');
        else 
            b = X_new; X_middle = X_middle; f_middle = f_middle;
            %plot(X_middle,f_middle,'rx');
        end
    end
    fprintf('%d\t%d\t%d\t%d', a, b, X_middle, X_new)
    X_new = min(b - X_middle,a+X_middle); f_new = fhandle(X_new);
end
if X_middle > X_new
        b = X_middle;
    else
        a = X_middle; 
end
var1 = a; var2 = b;
end 