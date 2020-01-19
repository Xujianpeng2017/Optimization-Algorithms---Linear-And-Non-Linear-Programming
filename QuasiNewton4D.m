function [X_final] = QuasiNewton4D(func,X_init, n)
B_i_init = eye(4,4);
% we start initially by making the negative gradient to be the search
% direction and then iterate to find Bi+1 for the next iterations and alpha
% to be initially 1 keep in mind that we will do only rank 1 update
%plot(X_init,func(X_init),'rx')
syms x y z w 
X_grad = gradient(func,[x,y, z, w]);
X_grad_1 = vpa(subs(X_grad,[x,y,z,w],[X_init(1),X_init(2), X_init(3), X_init(4)]));
syms r
f = X_init' - r * X_grad_1;
gg = subs(func,[x,y,z,w], [f(1),f(2),f(3),f(4)]);
gg_diff = gradient(gg, r);
lmda_star = vpa(solve(gg_diff == 0, r));
lmda_star_1 = lmda_star(1);
S_1 = -X_grad_1;
X_2 = X_init' + lmda_star_1 * S_1;
X_new = X_2;
%plot(X_new,func(X_new),'rx')
X_grad_2 = vpa(subs(X_grad,[x,y,z,w],[X_2(1),X_2(2),X_2(3),X_2(4)]));
y_i_init = X_grad_2 - X_grad_1;
S_i_init = X_2 - X_init';
Z_i_init = y_i_init - B_i_init * S_i_init;
m_init = Z_i_init' *S_i_init;
a_init = (1/(m_init+0.0000001));
B_i = B_i_init - ((B_i_init*S_i_init*S_i_init'*B_i_init)/(S_i_init' * B_i_init * S_i_init)) + ((y_i_init * y_i_init')/(y_i_init' * S_i_init));%((Z_i_init * Z_i_init')/a_init);
X_grad_old = X_grad_2;
disp(X_new)
for i = 1:n
    if mod(i,2) == 0
        B_i = eye(4,4) + (B_i./(max(B_i)));
    end
    S_i = - B_i * X_grad_old;
    X_old = X_new;
    ff = X_old' - r * X_grad_old;
    gg = subs(func,[x,y,z,w], [ff(1),ff(2),ff(3),ff(4)]);
    gg_diff = gradient(gg, r);
    lmda_star = vpa(solve(gg_diff == 0, r));
    lmda_star_1 = lmda_star(1);
    X_new = X_new + lmda_star_1 * S_i;
    %plot(X_new,func(X_new),'rx')
    X_grad_new = vpa(subs(X_grad,[x,y,z,w],[X_new(1),X_new(2),X_new(3),X_new(4)]));
    y_i = X_grad_new - X_grad_old;
    X_grad_old = X_grad_new;
    s_i = X_new - X_old;
    Z_i = y_i - B_i * s_i;
    m = Z_i' *s_i;
    a = (1/m);
    B_i = B_i - ((B_i* s_i * s_i' *B_i)/(s_i' * B_i * s_i)) + ((y_i * y_i')/(y_i' * s_i));
    disp(X_new)
end
X_final = X_new;
end

