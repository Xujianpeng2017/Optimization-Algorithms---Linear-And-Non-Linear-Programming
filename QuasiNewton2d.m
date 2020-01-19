function [X_final,f] = QuasiNewton2d(func,X_init, n)
% I will use for this function a full step newton having lmda_star = 1
B_i_init = eye(2,2);
% we start initially by making the negative gradient to be the search
% direction and then iterate to find Bi+1 for the next iterations and alpha
% to be initially 1 keep in mind that we will do only rank 1 update
%plot(X_init,func(X_init),'rx')
syms x y 
X_grad = gradient(func,[x,y]);
X_grad_1 = vpa(subs(X_grad,[x,y],[X_init(1),X_init(2)]));
syms r
f = X_init' - r * X_grad_1;
gg = subs(func,[x,y], [f(1),f(2)]);
gg_diff = gradient(gg, r);
lmda_star_1 = vpa(solve(gg_diff == 0, r));
S_1 = -X_grad_1;
X_2 = X_init' + S_1;
X_new = X_2;
%plot(X_new,func(X_new),'rx')
X_grad_2 = vpa(subs(X_grad,[x,y],[X_2(1),X_2(2)]));
y_i_init = X_grad_2 - X_grad_1;
S_i_init = X_2 - X_init';
%Z_i_init = y_i_init - B_i_init * S_i_init;
%m_init = Z_i_init' *S_i_init;
%a_init = (1/(m_init+0.0001));
B_i = B_i_init - ((B_i_init*S_i_init*S_i_init'*B_i_init)/(S_i_init' * B_i_init * S_i_init)) + ((y_i_init * y_i_init')/(y_i_init' * S_i_init)); %((Z_i_init * Z_i_init')/a_init);
X_grad_old = X_grad_2;
disp(X_new)
f = (subs(func,[x,y], [X_new(1),X_new(2)]));
X_final = X_new;
for i = 1:n
    if mod(i,2) == 0
        B_i = eye(2,2) + (B_i./(max(B_i)));
    end
    S_i = - B_i * X_grad_old;
    X_old = X_new;
    ff = X_old' - r * B_i * X_grad_old;
    gg = subs(func,[x,y], [ff(1),ff(2)]);
    gg_diff = gradient(gg, r);
    lmda_star_1 = vpa(solve(gg_diff == 0, r));
    X_new = X_new + lmda_star_1 * S_i;
    %plot(X_new,func(X_new),'rx')
    X_grad_new = vpa(subs(X_grad,[x,y],[X_new(1),X_new(2)]));
    y_i = X_grad_new - X_grad_old;
    X_grad_old = X_grad_new;
    s_i = X_new - X_old;
%   Z_i = y_i - B_i * s_i;
%   m = Z_i' *s_i;
%   a = (1/m);
    B_i = B_i - ((B_i* s_i * s_i' *B_i)/(s_i' * B_i * s_i)) + ((y_i * y_i')/(y_i' * s_i));
    disp(X_new)
    f(length(f)+1) = (subs(func,[x,y], [X_new(1),X_new(2)]));
    X_final(:,length(X_final) +1) = X_new;
    S_i = - B_i * X_grad_old;
    X_old = X_new;
    ff = X_old' - r * X_grad_old;
    gg = subs(func,[x,y], [ff(1),ff(2)]);
    gg_diff = gradient(gg, r);
    lmda_star_1 = vpa(solve(gg_diff == 0, r));
    X_new = X_new + lmda_star_1 * S_i;
    %plot(X_new,func(X_new),'rx')
    X_grad_new = vpa(subs(X_grad,[x,y],[X_new(1),X_new(2)]));
    y_i = X_grad_new - X_grad_old;
    X_grad_old = X_grad_new;
    s_i = X_new - X_old;
%   Z_i = y_i - B_i * s_i;
%     m = Z_i' *s_i;
%     a = (1/m);
    B_i = B_i - ((B_i* s_i * s_i' *B_i)/(s_i' * B_i * s_i)) + ((y_i * y_i')/(y_i' * s_i));
    disp(X_new)
    f(length(f)+1) = (subs(func,[x,y], [X_new(1),X_new(2)]));
    X_final(:,length(X_final) +1) = X_new;
end 
end
