function [alphax, alphas] = step_length(x, s, Dx, Ds)
alphas = -1/min(min(Ds./s),-1); 
alphas = min(1, 0.985 * alphas);
alphax = -1/min(min(Dx./x),-1); 
alphax = min(1, 0.985 * alphax);
end