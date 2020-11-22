function [] = drawLimitCycle(system, rightPart, color)
%DRAWLIMITCYCLE Draws a limit cycle of a Kachmarz algorithm
% NB!! needs a kacmarz.m function 
[m,n] = size(system);
if n ~= 2
    disp("Imposible draw a cycle for a current size " + m);
else
    limitCycle = kachmarz(system, rightPart);
    limitCycle = [limitCycle; limitCycle(1,:)];
    xpoints = limitCycle(:, 1); 
    ypoints = limitCycle(:, 2);    
    plot(xpoints, ypoints, 'color', color);
    hold on;
end    
end

