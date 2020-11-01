clear; clc;
n = 2;
m = 4;
[system, rightPart] = makeSystem(m, n);
[nSystem, nRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);

maxNormCoefficient = 100;
psolutions = zeros(0, maxNormCoefficient);

for i=1:maxNormCoefficient
    psolutions(i) = norm(pinv(nSystem * i) * nRightPart);
end

line(1:maxNormCoefficient, psolutions)
xlabel('Coefficient * normilizedMatrix')
ylabel('Norm of Pseudosolution')
