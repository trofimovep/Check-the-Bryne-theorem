function[A, B, gpsol] = build2D_loop(M)
% Returns the matrix A and vector B, and geometrical pseudosolution gpsol
% for which the system Ax = B converges to the limit cycle 
% (on plane) when Kachmarz algo   

[m, n] = size(M); % n must be equals 2
A = zeros(m, n);
B = zeros(m, 1);
x = -10:0.1:10;

% draw an input polygon
figure(1);
axis([min(M(:,1))-1 max(M(:,1))+1 min(M(:,2))-1 max(M(:,2))+1]);
fill(M(:, 1),M(:, 2), 'y'); hold on;

for i = 1:m
    if i == m
        vi = M(i, :);
        next_vi = M(1, :);
    else
        vi = M(i, :);
        next_vi = M(i + 1, :);
    end
    
    [k1, k2] = two_point_equation(vi, next_vi);
    [a, b, c] = normal_throw_the_point(k1, k2, next_vi(1), next_vi(2));
    A(i, :) = [a, b];
    B(i) = c;
    [z, d] = abcTokb(a, b, c);
    y = z * x + d;
    axis([min(M(:,1))-1 max(M(:,1))+1 min(M(:,2))-1  max(M(:,2))+1])
    plot(x, y, 'r');
    hold on;
end


psolve = pinv(A) * B;
gpsol = gpsolve(A, B);
baricenter = find_baricenter(M);

disp('Pseudosolution:'); disp(psolve);
disp('Geometrical pseudosolution:'); disp(gpsol);
disp('Baricenter:'); disp(baricenter);

x = [psolve(1) gpsol(1) baricenter(1)];
y = [psolve(2) gpsol(2) baricenter(2)];

labels = {'pseudosolution', 'geometrical pseudosolution', 'baricenter'};
plot(x,y,'o')
text(x,y,labels,'VerticalAlignment','bottom','HorizontalAlignment','right');
hold on;

end

