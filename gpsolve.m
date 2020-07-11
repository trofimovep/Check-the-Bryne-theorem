function[gpsol] = gpsolve(A, B)
% Returns geometrical pseudosolution (with normilized rows of A)

[m, n] = size(A);
nA = zeros(m, n);
nB = zeros(m, 1);

for i = 1:m
    ai = A(i, :);
    nrm = norm(ai);
    nA(i ,:) = ai ./ nrm;
    nB(i) = B(i) / nrm;
end

gpsol = pinv(nA) * nB;
end
