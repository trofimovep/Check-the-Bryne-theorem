function [center] = find_sphere_center(points)
%FIND_SPHERE_CENTER 
% Find sphere center by points on it. (n+1 points for n-sphere)
[m, n] = size(points);
if (m - n ~= 1)
    exception = "Imposible to build " + n + " sphere throw " + m + " points";
%     throw(MException('MyComponent:wrongDimension', exception));
    disp(exception);
    return;
end
x0 = points(1, :);
v = zeros(m - 1, 1);
u = zeros(m - 1, n);

for i = 2:m
    temp = points(i, :) - x0;
    norma = norm(temp);
    u(i - 1, :) = temp ./ norma;
    v(i - 1) = norma / 2;
end
center = x0' + inv(u) * (v);
end

