function [brc] = find_baricenter(A)
[m, ~] = size(A);
brc = sum(A) / m;
end