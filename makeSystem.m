function [system, rightpart] = makeSystem(m,n)
% This function makes a system AX = B with random coefficient
% where n - variable amount, m - amount of equation  
system = rand(m, n);
rightpart = rand(m , 1);
disp('Current system: '); disp(system);
disp('Right part:'); disp(rightpart);
end

