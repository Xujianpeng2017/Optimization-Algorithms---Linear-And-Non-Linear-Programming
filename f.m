function [y] = f(x)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
y = 0.65 - (0.75/(1+x^2)) - 0.65 * x * atan(1/x);
%y = x^5 - 5 * x^3 - 20 * x + 5;
end

