function [B,f_B, t] = compute_B(fhandle,t_0,A,f_A)
f_1 = fhandle(A+t_0);
i = 1;
while f_1 >= f_A
    t_0 = t_0 * 2 * i;
    f_1 = fhandle(A+t_0);
    i = i + 1;
end
B = A + t_0;
f_B = fhandle(B);
t = t_0;
end

