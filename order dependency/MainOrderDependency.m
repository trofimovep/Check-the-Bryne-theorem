clear; clc; close all;

n = 2; 
m = 3;
[system, rightPart] = makeSystem(m, n);        
[normSystem, normRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);
gpsol = pinv(normSystem) * normRightPart;

colors = ['r', 'b', 'g'];
legends = ['1-2-3 order', '1-3-2 order', '3-1-2 order'];
x = linspace(-10, 10);

figure;
for i = 1:m
    y = (-system(i,1)*x + rightPart(i)) / system(i,2);
    plot(x, y, 'LineWidth', 1.5, 'color', 'black');
    grid on;
    tl = texlabel('I');
    text(x(i), y(i), tl,'FontSize', 7);
    hold on;
end
% 1 2 3 order
drawLimitCycle(normSystem, normRightPart,colors(1));

% 1 3 2 order
system132 = normSystem;
systemBuff = system132(3,:);
system132(3,:) = system132(2,:);
system132(2,:) = systemBuff;
rightPart132 = normRightPart;
rightPartBuff = rightPart132(3);
rightPart132(3) = rightPart132(2);
rightPart132(2) = rightPartBuff;
figure;
for i = 1:m
    y = (-system132(i,1)*x + rightPart132(i)) / system132(i,2);
    plot(x, y, 'LineWidth', 1.5, 'color', 'black');
    grid on;
    tl = texlabel('I');
    text(x(i), y(i), tl,'FontSize', 7);
    hold on;
end
drawLimitCycle(system132, rightPart132,colors(2));

% 3 1 2 order
system312 = system132;
buff = system312(1,:);
system312(1,:) = system312(2,:);
system312(2,:) = buff;
rightPart312 = rightPart132;
rightPartBuff = rightPart312(1);
rightPart312(1) = rightPart312(2);
rightPart312(2) = rightPartBuff;
figure;
for i = 1:m
    y = (-system312(i,1)*x + rightPart312(i)) / system312(i,2);
    plot(x, y, 'LineWidth', 1.5, 'color', 'black');
    grid on;
    tl = texlabel('I');
    text(x(i), y(i), tl,'FontSize', 7);
    hold on;
end
drawLimitCycle(system312, rightPart312, colors(3));







