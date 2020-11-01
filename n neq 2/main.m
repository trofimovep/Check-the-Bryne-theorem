clear; clc;
n = 2; % число неизвестных
diff = 3;
m = n + diff; % число уравнений

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

disp('Check the geometrical pseudisolution in a subset of linear shell of form the n centers spheres (n-dimensional)')
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






