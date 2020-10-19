clear; clc;
n = 2; % число неизвестных
diff = 3;
m = n + diff; % число уравнений

% system =  randi([-1, 1], m, n);
system = rand(m, n);
rightpart = rand(m , 1);

disp('Current system: '); disp(system);
disp('Right part:'); disp(rightpart);

loop = kachmarz(system, rightpart);
disp('Loop for the current system:'); disp(loop);

psol = pinv(system) * rightpart;
disp('Pseudosolution: '); disp(psol);

gpsol = gpsolve(system, rightpart);
disp('Geometrical pseudoslution: '); disp(gpsol);

% center = find_sphere_center(loop);

% % Проверка гипотезы, о том что псевдорешение лежит в выпуклой оболочке всех
% % поднаборов n + 1
% combos = nchoosek(1:m, n+1); % берем (n+1) точку, чтобы мы могли найти сферу
% combosAmount = size(combos(),1);
% if combosAmount > 1
%     centers = zeros(combosAmount, n);
%     currentPoints = zeros(n + 1, n);
%     for i=1:combosAmount
%         for j=1:n+1
%             currentPoints(j, :) = loop(combos(i, j), :);
%         end
%         centers(i, :) = find_sphere_center(currentPoints);
%     end
% end
% disp('Centers: ')
% disp(centers)
% 
% convCheck = [centers; gpsol'];
% if size(convhull(convCheck)) < combosAmount
%     disp('The geometrical in')
% else
%     disp('The geometrical out')
% end
% 
% convCheck2 = [centers; psol'];
% if size(convhull(convCheck2)) < combosAmount
%     disp('The in')
% else
%     disp('The out')
% end

% gpsolIn = 0;
% psolIn = 0;
% for n=2:10
%   for diff=1:10
%       m =  n + diff;
%       system = rand(m, n);
%       rightpart = rand(m , 1);
%       loop = kachmarz(system, rightpart);
%       gpsol = gpsolve(system, rightpart);
%       psol = pinv(system) * rightpart;
%       [gpsin, pin] = checkInConvHull(loop, n, m, gpsol, psol);
%       
%       if gpsin
%         gpsolIn = gpsolIn + 1;
%       else
%           print = "G pseudosolution not in convh (" + n + " dimensional, " + m + " eq-s )";
%           disp(print)
%       end
%       
%       if pin
%         psolIn = gpsolIn + 1;
%       else
%           print = "Pseudosolution not in convh (" + n + " dimensional, " + m + " eq-s )";
%           disp(print)
%       end
%   end
% end


for i = 2:10
gpsolIn = 0;
psolIn = 0;
      n = i;
      diff = 2;
      m =  n + diff;
      system = rand(m, n);
      rightpart = rand(m , 1);
      loop = kachmarz(system, rightpart);
      gpsol = gpsolve(system, rightpart);
      psol = pinv(system) * rightpart;
      [gpsin, pin] = checkInConvHull(loop, n, m, gpsol, psol);
      
      if gpsin
        gpsolIn = gpsolIn + 1;
      else
          print = "G pseudosolution not in convh (" + n + " dimensional, " + m + " eq-s )";
          disp(print)
      end
      
      if pin
        psolIn = gpsolIn + 1;
      else
          print = "Pseudosolution not in convh (" + n + " dimensional, " + m + " eq-s )";
          disp(print)
      end
     
end
disp('Finish: ')




