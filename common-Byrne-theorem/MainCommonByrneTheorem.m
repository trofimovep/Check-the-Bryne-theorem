clear; clc;

inLinear = 0;
outOfLinear = 0;
for n = 3:3
    for k = 2:7
        m = n + k;
        disp("Number of variables: " + n);
        disp("Number of Equation: " + m);
        [system, rightPart] = makeSystem(m, n);
        [normSystem, normRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);
        permutations = arranges(m, n+1);
        [permutationsVars, ~] = size(permutations);
        disp("Permutations variants: " + permutationsVars);
        
        if permutationsVars > 1
            gpsol = pinv(normSystem) * normRightPart; % geometrical pseudosolution
            centers = zeros(permutationsVars, n);           
            currentSubSystem = zeros(n+1, n);
            currentSubRightPart = zeros(n+1, 1);
            for var = 1:permutationsVars
                for i = 1:n+1 
                    currentSubSystem(i, :) = normSystem(permutations(var, i), :);
                    currentSubRightPart(i) = normRightPart(i);
                end
                currentGeomPseudoSol = pinv(currentSubSystem) * currentSubRightPart;
                centers(var, :) = currentGeomPseudoSol;
            end
            
         if VectorInConvHull(centers, gpsol')
            inLinear = inLinear  + 1;
            disp('--- For this in a conv hull ---');
         else
             outOfLinear = outOfLinear + 1;
             disp('--- For this NOT in a conv hull ---');
         end
         disp('================================================')
        end
    end
end

disp("In total in conv hull: " + inLinear);
disp("In total NOT in conv hull: " + outOfLinear);



