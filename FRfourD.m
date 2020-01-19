function [X_final] = FRfourD(func,X_init)
syms x y z w
X_grad = gradient(func,[x,y,z,w]);
X_grad_value = vpa(subs(X_grad,[x,y,z,w],[X_init(1),X_init(2), X_init(3),X_init(4)]));
S_1 = -X_grad_value;
X_grad_old = X_grad_value;
syms r
f = X_init' + r * X_grad_value;
gg = subs(func,[x,y,z,w], [f(1),f(2),f(3), f(4)]);
gg_diff = gradient(gg, r);
lmda_star_1 = vpa(solve(gg_diff == 0, r));
X_2 = X_init + lmda_star_1 * S_1';
disp(X_2) 
if norm(X_grad_value) ~= 0
    X_init = X_2;
    X_grad_value = vpa(subs(X_grad,[x,y,z,w],[X_2(1), X_2(2), X_2(3), X_2(4)]));
    S_2 = - X_grad_value + ((norm(X_grad_value))^2/(norm(X_grad_old))^2) * S_1;
    X_grad_old = X_grad_value;
    f = X_init' + r * S_2;
    gg = subs(func,[x,y,z,w], [f(1),f(2),f(3), f(4)]);
    gg_diff = gradient(gg, r);
    lmda_star_1 = vpa(solve(gg_diff == 0, r));
    X_2 = X_init + lmda_star_1 * S_2';
    S_1 = S_2;
end
disp(X_2)
if norm(X_grad_value) ~= 0
    X_init = X_2;
    X_grad_value = vpa(subs(X_grad,[x,y,z,w],[X_2(1), X_2(2), X_2(3), X_2(4)]));
    S_2 = - X_grad_value + ((norm(X_grad_value))^2/(norm(X_grad_old))^2) * S_1;
    X_grad_old = X_grad_value;
    f = X_init' + r * S_2;
    gg = subs(func,[x,y,z,w], [f(1),f(2), f(3), f(4)]);
    gg_diff = gradient(gg, r);
    lmda_star_1 = vpa(solve(gg_diff == 0, r));
    X_2 = X_init + lmda_star_1 * S_2';
    S_1 = S_2;
end
X_final = X_2;
disp(X_final)
end