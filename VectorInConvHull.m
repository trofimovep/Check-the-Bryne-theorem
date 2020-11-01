function [inConvHull] = VectorInConvHull(matrix, vector)
%UNTITLED Returns the boolean if vector in conv hull of matrix
inConvHull = false;
startMatrixConvHull = convhull(matrix);
startMatrixConvHullRank = rank(startMatrixConvHull);

wideMatrix = [matrix; vector];
wideMatrixConvHull = convhull(wideMatrix);
wideMatrixConvHullRank = rank(wideMatrixConvHull);

if wideMatrixConvHullRank < startMatrixConvHullRank
    inConvHull = true;
end
end

