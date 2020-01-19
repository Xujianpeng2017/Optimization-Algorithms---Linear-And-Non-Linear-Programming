function [var1,var2] = golden_search(fhandle,a,b,n)
interval = b-a;
ratio = 0.382*interval;
X_2 = b-ratio;X_1 = a+ratio;
count = 2;
f_1 = fhandle(X_1);f_2 = fhandle(X_2);
if f_1 < f_2
    b = X_2; X_middle = X_1;f_middle = fhandle(X_1);
else
    a = X_1; X_middle = X_2;f_middle = fhandle(X_2);
end
fprintf('%d\t%d\t%d\t%d', a, b, X_1, X_2)
while count <= n
    if f_1 < f_2
        b=X_2;
        X_2=X_1;
        X_1=a+.382*(b-a);
        f_1=f(X_1);
        f_2=f(X_2);
    else
        a=X_1;
        X_1=X_2;
        X_2=b-.382*(b-a);
        f_1=f(X_1);
        f_2=f(X_2);
    end
    count = count + 1;
end
var1 = a, var2 = b;
end