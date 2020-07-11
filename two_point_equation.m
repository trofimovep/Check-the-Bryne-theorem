function[a, b] = two_point_equation(v1, v2)
% ax + by + c = 0 
% The function count the a and b for the line 
% which cross the two given points v1, v2
% (we don't return the c because it is not needed further)

a = -(v2(2) - v1(2));
b = (v2(1) - v1(1));
end