function [Z] = funcc()
syms x y z w
Z = (x + 10 * y)^2 + 5 * (z - w)^2 +  (y - 2 * z)^4 + 10 * (x - w)^4;
end

