function [gpsolIn,psolIn] = checkInConvHull(loop, n, m, gpsol, psol)
% Проверка гипотезы, о том что псевдорешение лежит в выпуклой оболочке всех
% поднаборов n + 1
gpsolIn = false;
psolIn = false;

combos = nchoosek(1:m, n+1); % берем (n+1) точку, чтобы мы могли найти сферу
combosAmount = size(combos(),1);
if combosAmount > 1
    centers = zeros(combosAmount, n);
    currentPoints = zeros(n + 1, n);
    for i=1:combosAmount
        for j=1:n+1
            currentPoints(j, :) = loop(combos(i, j), :);
        end
        centers(i, :) = find_sphere_center(currentPoints);
    end
    
    try
        convCheck = [centers; gpsol'];
        if size(convhull(convCheck)) < combosAmount
            gpsolIn = true;
        end
        convCheck2 = [centers; psol'];
        if size(convhull(convCheck2)) < combosAmount
            psolIn = true;
        end
    catch
    end
end

end

