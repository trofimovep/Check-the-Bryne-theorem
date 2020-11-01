function [a,b,c] = normal_throw_the_point(k1, k2, x, y)
%NORMAL_THROW_THE_POINT
% This returns the a, b, c of line ax + by + c
% which is normal the for the line k1 * x + k2 * y = c
% and cross the point v = (x, y), 

a = -k2;
b = k1;
c = -k2 * x + k1 * y;
end

