clear; clc;

n = 2; 
m = 3;
[system, rightPart] = makeSystem(m, n);        
[normSystem, normRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);
gpsol = pinv(normSystem) * normRightPart;

permutations = perms(1:m);
[permutationsVar, ~] = size(permutations);
disp("Permutation amount: " + permutationsVar);

x = linspace(-3, 3);
for i = 1:m
    y = (-system(i,1)*x + rightPart(i)) / system(i,2);
    plot(x, y, 'LineWidth', 1.5);
    tl = texlabel('I');
    text(x(i), y(i), tl,'FontSize', 7);
    hold on;
end

for i=1:permutationsVar
end


