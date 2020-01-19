function [X_final] = MarqrdtfourD(func,X_init, a, c_1, c_2, eps)
syms x y z w
X_grad = gradient(func,[x,y,z,w]);
X_grad_value = vpa(subs(X_grad,[x,y,z,w],[X_init(1),X_init(2), X_init(3),X_init(4)]));
identity = eye(4,4);
if norm(X_grad_value) > eps
    J_1 = hessian(func,[x,y,z,w]);
    Hessian_Value = vpa(subs(J_1,[x,y,z,w],[X_init(1),X_init(2), X_init(3), X_init(4)]));
    X_2 = X_init' - inv(Hessian_Value + a *identity) * X_grad_value;
    if vpa(subs(func,[x,y,z,w], [X_2(1), X_2(2), X_2(3), X_2(4)])) < vpa(subs(func,[x,y,z,w], [X_init(1), X_init(2), X_init(3), X_init(4)]))
        a = c_1 * a;
    else
        a = c_2 * a;
    end
end
X_init = X_2;
disp(X_2)
X_grad_value = vpa(subs(X_grad,[x,y,z,w],[X_init(1),X_init(2), X_init(3), X_init(4)]));   
if norm(X_grad_value) > eps
    J_1 = hessian(func,[x,y,z,w]);
    Hessian_Value = vpa(subs(J_1,[x,y,z,w],[X_init(1),X_init(2), X_init(3), X_init(4)]));
    X_2 = X_init - inv(Hessian_Value + a *identity) * X_grad_value;
    if vpa(subs(func,[x,y,z,w], [X_2(1), X_2(2), X_2(3), X_2(4)])) < vpa(subs(func,[x,y,z,w], [X_init(1), X_init(2), X_init(3), X_init(4)]))
        a = c_1 * a;
    else
        a = c_2 * a;
    end
end
X_final = X_2;
end

