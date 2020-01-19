function [lambda_star,f_lmda_star,h_lmda_star] = Quadratic_interpolation(fhandle,t_0, A_0)
A = A_0;
f_A = fhandle(A_0);
[B,f_B,t_1] = compute_B(fhandle,t_0,A,f_A);
[B,f_B,C,f_C,t] = compute_C(fhandle,A,f_A,B,f_B,t_1);
a = ((f_A * B * C*(C-B) + f_B*C*A*(A-C) + f_C*A*B*(B-A))/((A-B) * (B-C) * (C-A)));
b = ((f_A * (B^2-C^2) + f_B*(C^2-A^2) + f_C*(A^2 - B^2))/((A-B) * (B-C) * (C-A)));
c = -1*((f_A * (B-C) + f_B*(C-A) + f_C*(A - B))/((A-B) * (B-C) * (C-A)));
lambda_star = -b/(2*c);
h_lmda_star = a + b*lambda_star + c*(lambda_star^2);
f_lmda_star = fhandle(lambda_star);
disp(h_lmda_star)
disp(f_lmda_star)
disp(lambda_star) 
if lambda_star > A && lambda_star < B
    if f_lmda_star > f_B
        A = lambda_star; f_A = fhandle(A); 
    end
    if f_lmda_star <= f_B
        B = lambda_star; f_B = fhandle(B); 
    end
end 
if lambda_star > B && lambda_star < C
    if f_lmda_star < f_B
        B = lambda_star; f_B = fhandle(B); 
    end
    if f_lmda_star > f_B 
        C = lambda_star; f_C = fhandle(C); 
    end
end
a = ((f_A * B * C*(C-B) + f_B*C*A*(A-C) + f_C*A*B*(B-A))/((A-B) * (B-C) * (C-A)));
b = ((f_A * (B^2-C^2) + f_B*(C^2-A^2) + f_C*(A^2 - B^2))/((A-B) * (B-C) * (C-A)));
c = -((f_A * (B-C) + f_B*(C-A) + f_C*(A - B))/((A-B) * (B-C) * (C-A)));
lambda_star = -b/(2*c);
h_lmda_star = a + b*lambda_star + c*(lambda_star^2);
f_lmda_star = fhandle(lambda_star); 
disp(h_lmda_star)
disp(f_lmda_star)
disp(lambda_star)
if lambda_star > A && lambda_star < B
    if f_lmda_star > f_B
        A = lambda_star; f_A = fhandle(A); 
    end
    if f_lmda_star < f_B
        B = lambda_star; f_B = fhandle(B); 
    end
end 
if lambda_star > B && lambda_star < C
    if f_lmda_star < f_B
        B = lambda_star; f_B = fhandle(B); 
    end
    if f_lmda_star > f_B 
        C = lambda_star; f_C = fhandle(C); 
    end
end
a = ((f_A * B * C*(C-B) + f_B*C*A*(A-C) + f_C*A*B*(B-A))/((A-B) * (B-C) * (C-A)));
b = ((f_A * (B^2-C^2) + f_B*(C^2-A^2) + f_C*(A^2 - B^2))/((A-B) * (B-C) * (C-A)));
c = -((f_A * (B-C) + f_B*(C-A) + f_C*(A - B))/((A-B) * (B-C) * (C-A)));
lambda_star = -b/(2*c);
h_lmda_star = a + b*lambda_star + c*(lambda_star^2);
f_lmda_star = fhandle(lambda_star); 
disp(f_lmda_star)
disp(h_lmda_star)
disp(lambda_star)
end


