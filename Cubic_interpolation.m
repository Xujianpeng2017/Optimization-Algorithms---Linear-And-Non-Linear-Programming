function [lmda_star, f_lmda_star,h_lmda_star] = Cubic_interpolation(fhandle,t_0, A_0)
A = A_0; 
syms x
f_A = vpa(subs(fhandle,x,A));
f_A_prime = vpa(subs(diff(fhandle,x,1),x,A));
[B,f_B,f_B_prime,t] = compute_bb(A,f_A,f_A_prime,t_0,fhandle);
Z = (3*(f_A - f_B)/(B-A)) + f_A_prime + f_B_prime;
d = ((2*Z + f_A_prime + f_B_prime)/(3*(A-B)^2));
c = -(((A+B)*Z + B * f_A_prime + A*f_B_prime)/(A-B)^2);
b = ((B^2 * f_A_prime + A^2 * f_B_prime + 2 * A * B * Z)/(A-B)^2);
a = f_A - b*A - c* A^2 - d * A^3;
lmda_star_1 = (-c + (c^2 - 3*b*d)^0.5)/(3*d);
lmda_star_2 = (-c - (c^2 - 3*b*d)^0.5)/(3*d);
if lmda_star_1 > A && lmda_star_1 < B
    lmda_star = lmda_star_1;
else
    lmda_star = lmda_star_2;
end
f_lmda_star = vpa(subs(fhandle,x,lmda_star));
f_prime_lmda_star = vpa(subs(diff(fhandle,x,1),x,lmda_star));
h_lmda_star = a + b * lmda_star + c * lmda_star^2 + d * lmda_star^3 ;
disp(lmda_star)
disp(f_lmda_star)
disp(f_prime_lmda_star)
disp(h_lmda_star)
if f_prime_lmda_star < 0
    A = lmda_star; f_A = f_lmda_star; f_prime_A = f_prime_lmda_star;
else 
    B = lmda_star; f_B = f_lmda_star; f_prime_B = f_prime_lmda_star;
end
Z = (3*(f_A - f_B)/(B-A)) + f_A_prime + f_B_prime;
d = ((2*Z + f_A_prime + f_B_prime)/(3*(A-B)^2));
c = -(((A+B)*Z + B * f_A_prime + A*f_B_prime)/(A-B)^2);
b = ((f_A_prime * B^2 + f_B_prime * A^2 + 2 * A * B * Z)/(A-B)^2);
a = f_A - b*A - c* A^2 - d * A^3;
Q = (Z^2 - f_A_prime * f_B_prime)^0.5;
lmda_star_1 = A + ((f_A_prime + Z + Q)*(B-A)/(f_A_prime + f_B_prime + 2*Z));
lmda_star_2 = A + ((f_A_prime + Z - Q)*(B-A)/(f_A_prime + f_B_prime + 2*Z));
if lmda_star_1 > A && lmda_star_1 < B
    lmda_star = lmda_star_1;
else
    lmda_star = lmda_star_2;
end
f_lmda_star = vpa(subs(fhandle,x,lmda_star));
f_prime_lmda_star = vpa(subs(diff(fhandle,x,1),x,lmda_star));
h_lmda_star = a + b * lmda_star + c * lmda_star^2 + d * lmda_star^3 ;
disp(lmda_star)
disp(f_lmda_star)
disp(f_prime_lmda_star)
disp(h_lmda_star)
if f_prime_lmda_star < 0
    A = lmda_star; f_A = f_lmda_star; f_prime_A = f_prime_lmda_star;
else 
    B = lmda_star; f_B = f_lmda_star; f_prime_B = f_prime_lmda_star;
end
Z = (3*(f_A - f_B)/(B-A)) + f_A_prime + f_B_prime;
d = ((2*Z + f_A_prime + f_B_prime)/(3*(A-B)^2));
c = -(((A+B)*Z + B * f_A_prime + A*f_B_prime)/(A-B)^2);
b = ((f_A_prime * B^2 + f_B_prime * A^2 + 2 * A * B * Z)/(A-B)^2);
a = f_A - b*A - c* A^2 - d * A^3;
Q = (Z^2 - f_A_prime * f_B_prime)^0.5;
lmda_star_1 = A + ((f_A_prime + Z + Q)*(B-A)/(f_A_prime + f_B_prime + 2*Z))
lmda_star_2 = A + ((f_A_prime + Z - Q)*(B-A)/(f_A_prime + f_B_prime + 2*Z))
if lmda_star_1 > A && lmda_star_1 < B
    lmda_star = lmda_star_1;
else
    lmda_star = lmda_star_2;
end
f_lmda_star = vpa(subs(fhandle,x,lmda_star));
f_prime_lmda_star = vpa(subs(diff(fhandle,x,1),x,lmda_star));
h_lmda_star = a + b * lmda_star + c * lmda_star^2 + d * lmda_star^3 ;
disp(lmda_star)
disp(f_lmda_star)
disp(f_prime_lmda_star)
disp(h_lmda_star)
end
 