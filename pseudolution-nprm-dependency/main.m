clear; clc;
n = 4;
m = 5;
[system, rightPart] = makeSystem(m, n);
[nSystem, nRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);

maxNormCoefficient = 100;
psolutions = zeros(0, maxNormCoefficient);

for i=1:maxNormCoefficient
    psolutions(i) = norm(pinv(nSystem * i) * nRightPart);
end

line(psolutions, 1:maxNormCoefficient)
ylabel('Coefficient: $c$', 'interpreter', 'latex')
xlabel('$||p||=||(c * nM)^{+}*B||$, where nM - matrix with normilized rows','interpreter', 'latex')
