function [dx, dy, ds, L, D, p] = compute_Direction(rb, rc, rxs, A, m, n, x, s, L, D, p)
D_2 = -min(1e+16, s./x);
B = [sparse(m,m) A; A' sparse(1:n,1:n,D_2)];
rhs = sparse([-rb; -rc+rxs./x]);
if isempty(L) || isempty(D) || isempty(p)
    [L,D,p] = ldl(B,'vector');
end
sol(p,:) = L'\(D\(L\(rhs(p,:))));
dy = sol(1:m);
dx = sol(m+1:m+n);
ds = -(rxs+s.*dx)./x;
end