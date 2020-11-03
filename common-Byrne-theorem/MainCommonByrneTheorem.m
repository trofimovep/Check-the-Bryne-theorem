clear; clc;

inLinear = 0;
outOfLinear = 0;
for n = 2:2
    for k = 2:2
        m = n + k;
        disp("Number of variables: " + n);
        disp("Number of Equation: " + m);
        [system, rightPart] = makeSystem(m, n);        
        [normSystem, normRightPart] = normilizeMatrixRowsAndRightPart(system, rightPart);
        gpsol = pinv(normSystem) * normRightPart; % geometrical pseudosolution
        
        permutations = arranges(m, n+1);
        [permutationsVars, ~] = size(permutations);
        disp("Permutations variants: " + permutationsVars);
        
        centers = zeros(permutationsVars, n);  
        if permutationsVars > 1         
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
         % Plotting part
         if n == 2 && k == 2
             x=linspace(-1.1, 1.1);
             for i = 1:4
                y = (-system(i,1)*x + rightPart(i)) / system(i,2);
                plot(x, y, 'LineWidth', 1.5);
                tl = texlabel("y=(" + -system(i,1)+"x+" + rightPart(i)+")/" +system(i,2));
                text(x(i), y(i), tl,'FontSize', 7);
                hold on;
             end
             plot(gpsol(1),gpsol(2),'o','Color','r','MarkerEdgeColor','k',...
                 'MarkerFaceColor','r', 'MarkerSize',6);
             hold on;
             
             for i=1:size(centers)
                 plot(centers(i, 1),centers(i, 2),'+','Color', 'magenta');
                 hold on;
             end
            hold off; 
         end
    end
end

disp("In total in conv hull: " + inLinear);
disp("In total NOT in conv hull: " + outOfLinear);






