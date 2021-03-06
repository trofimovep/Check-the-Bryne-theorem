function[gpsol] = gpsolve(A, B)
% Returns geometrical pseudosolution (with normilized rows of A)
[nA, nB] = normilizeMatrixRowsAndRightPart(A, B);
gpsol = pinv(nA) * nB;
end
