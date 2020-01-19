function [f,X_fin, Y_fin, S_fin, N] = Mehrotra(A, b, c)
[m,n] = size(A);
alphax = 0; alphas = 0;
[x, y, s] = initials(A, b, c);
R = [x;y;s];
[mm,nn] = size(R);
bc = 1+max([norm(b),norm(c)]);
R = [x;y;s];
[mm,nn] = size(R);
f = c'*x;
ff(1) = f;
for iter = 0:150
    rxs = x.*s;
    rc = A'*y+s-c;
    rb = A*x-b;
    myoo = mean(rxs);
    res  = norm([rb;rc;rxs])/bc;
    if res < 0.001
        break;
    end
    [dx_affine, dy_affine, ds_affine, L, D, p] =compute_Direction(rb, rc, rxs, A, m, n,x, s, [], [], []);
    [alpha_x_affine, alpha_s_affine] = step_length(x, s, dx_affine, ds_affine);
    mu_aff = (x+alpha_x_affine*dx_affine)'*(s+alpha_s_affine*ds_affine)/n;
    sigma = (mu_aff/myoo)^3;
    rxs = rxs + dx_affine.*ds_affine - sigma*myoo*ones(n,1);
    [dx_cc, dy_cc, ds_cc, ~, ~, ~] =compute_Direction(rb, rc, rxs, A, m, n,x, s, L, D, p);
    dx = dx_affine+dx_cc;
    dy = dy_affine+dy_cc;
    ds = ds_affine+ds_cc;
    [alphax, alphas] =  step_length(x, s, dx, ds);
    x = x + alphax*dx;
    y = y + alphas*dy;
    s = s + alphas*ds;
    f = c'*x;
    ff(length(ff)+1) = f;
    R(:,nn+1) = [x;y;s];
    [mm,nn] = size(R);
end
for uu = 1:11
    R(uu,:) = sort(R(uu,:));
end
x = R(1,:);
s = R(8,:);
XXXX = x;
x(find(x<=0)) = [];
s(find(XXXX<=0)) = [];
x2 = R(2,:);
XXX = x2;
x2(find(XXXX<=0)) = [];
s2 = R(9,:);
s2(find(XXXX<=0)) = [];
figure
plot(x,s, '-o')
xlabel('x1')
ylabel('s1')
title('Mehrotra')
X_fin = R([1:n],1);
S_fin = R([n+1:n+m],1);
Y_fin = R([n+m+1:n+n+m],1);
figure
plot(x.*s,x2.*s2, '-o')
xlabel('x1s1')
ylabel('x2s2')
title('Mehrotra Complementarity Condition')
figure
plot(x,x2, '-x')
xlabel('x1')
ylabel('x2')
title('Mehrotra')
figure
plot(s,s2, '-*')
xlabel('s1')
ylabel('s2')
title('Mehrotra')
figure
plot([1:length(ff)],sort(ff))
xlabel('iterations')
ylabel('f')
title('objective function')
N = iter;
%x = full(x); y = full(y); s = full(s); f = c'*x;
%X = R(1,:);
%S = R(mm-1,:);
%plot(X,S,'o-')
end

