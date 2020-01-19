function [B,f_B,f_B_prime,t] = compute_bb(A,f_A,f_prime_A,t_0,fhandle)
syms x
f_1 = vpa(subs(fhandle,x,A+t_0));
f_1_prime = vpa(subs(diff(fhandle,x,1),x,A+t_0));
i = 1;
while f_1_prime < 0
    t_0 = 2*i*t_0;
    f_1 = vpa(subs(fhandle,x,A+t_0));
    f_1_prime = vpa(subs(diff(fhandle,x,1),x,A+t_0));
    i = i+1;
end
B = A+t_0;
f_B = f_1;
f_B_prime = f_1_prime;
t = t_0;
end