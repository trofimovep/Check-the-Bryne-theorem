clear; clc;

m = 3;
n = 2;

% % loopPoints = [2 3; -2 1; -3 -1; 1 -3; 4 -1];
% % loopPoints =  randi([-1, 1], m, n);
loopPoints =  rand( m, n);
[k, l] = size(loopPoints);

[gotSystem, B, gpsolve] = build2D_loop(loopPoints);

disp('Builded system');
disp(gotSystem);

disp('Required cycle');
% cause in algo we change last and first rows
requiredCycle = [loopPoints(2:k,:); loopPoints(1,:)];
disp(requiredCycle);

if n == 2
    real_cycle = kachmarz(gotSystem, B);
    disp(real_cycle);
%     f = fill(real_cycle(:, 1), real_cycle(:,2), 'r');
%     set(f,'facealpha',.7);
    hold on;
end


if abs(requiredCycle-real_cycle) < 1e4*eps(min(abs(requiredCycle),abs(real_cycle)))
    disp('The polygons are equals!')
else
    disp('The polygons are NOT equals!')
end


% Check the Bryne theorem (1997) 
% The theorem:
%     If the system Ax = b has no exact solution, and if I = J +1, then the 
%     vectors of the limit cycle lie on a sphere in J-dimensional space 
%     having the least-squares solution at its center
[points_amount, ~] = size(loopPoints);

[center, radius] = calcCircle(loopPoints(1,:), loopPoints(2,:), loopPoints(3,:));
% viscircles(center,radius, 'Color', 'b'); 
hold off;


radiuses = zeros(1, points_amount);
for i = 1:points_amount
    radiuses(i) = sqrt(sum(loopPoints(i) - center) .^2 );
end
disp('The distance between geometrical pseudosolution and vertices of limit cycle')
disp(radiuses)


if (center == gpsolve)
    disp('Thats Bryne right')
else 
    disp('center')
    disp(center)
    disp('geometrical ')
    disp(gpsolve)
end 






