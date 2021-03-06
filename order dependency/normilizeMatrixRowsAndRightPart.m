function [normilizedRowsMatrix, normilizedRigtPart] = normilizeMatrixRowsAndRightPart(inputMatrix, rightPart)
%NORMILIZEMATRIXROWS normilizes matrix rows and divide rightpart on norm
%of left equation
[m, n] = size(inputMatrix);
normilizedRowsMatrix = zeros(m, n);
normilizedRigtPart = zeros(m, 1);
for i = 1:m
    ai = inputMatrix(i, :);
    nrm = norm(ai);
    normilizedRowsMatrix(i ,:) = ai ./ nrm;
    normilizedRigtPart(i) = rightPart(i) / nrm;
%     disp('Normailized Rows matrix'); disp(normilizedRowsMatrix);
%     disp('Normailized Right Part by rows norm'); disp(normilizedRigtPart);
end
end

