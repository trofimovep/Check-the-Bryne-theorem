function [k,b] = abcTokb(t, s, r)
%ABCTOKB 
%   return the k, b coefficients of line equation y = kx + b
%   from tx + sy + r = 0 form

k = - t / s;
b = - r / s;
end

