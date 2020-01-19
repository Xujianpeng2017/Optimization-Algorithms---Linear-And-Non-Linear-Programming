function [B,f_B,C,f_C,t] = compute_C(fhandle,A,f_A,B,f_B,t_0)
C = B + t_0;
f_2 = fhandle(B + t_0);
while f_2 < f_B 
    f_B = f_2;
    B = B + t_0;
    t_0 = 2 * t_0;
    f_2 = fhandle(A+2*t_0);
end
B = A + t_0;
C = A + 2 *t_0;
f_B = f_B;
f_C = f_2;
t = t_0;
end

