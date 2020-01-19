function [X_final] = Marquardt(func, X_init, a, c_1, c_2, eps)
syms x y
X_grad = gradient(func,[x,y]);
X_grad_value = vpa(subs(X_grad,[x,y],[X_init(1),X_init(2)]));
identity = eye(2,2);
if norm(X_grad_value) > eps
    J_1 = hessian(func,[x,y]);
    Hessian_Value = vpa(subs(J_1,[x,y],[X_init(1),X_init(2)]));
    X_2 = X_init' - inv(Hessian_Value + a *identity) * X_grad_value;
    if vpa(subs(func,[x,y], [X_2(1), X_2(2)])) < vpa(subs(func,[x,y], [X_init(1), X_init(2)]))
        a = c_1 * a;
    else
        a = c_2 * a;
    end
end
X_init = X_2;
disp(X_2)
X_grad_value = vpa(subs(X_grad,[x,y],[X_init(1),X_init(2)]));   
if norm(X_grad_value) > eps
    J_1 = hessian(func,[x,y]);
    Hessian_Value = vpa(subs(J_1,[x,y],[X_init(1),X_init(2)]));
    X_2 = X_init - inv(Hessian_Value + a *identity) * X_grad_value;
    if vpa(subs(func,[x,y], [X_2(1), X_2(2)])) < vpa(subs(func,[x,y], [X_init(1), X_init(2)]))
        a = c_1 * a;
    else
        a = c_2 * a;
    end
end
X_final = X_2;
end

