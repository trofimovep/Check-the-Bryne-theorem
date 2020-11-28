function [current_values] = kachmarz(A, B)
% The function returns the verticices of the limit cycle
% which were got from the Kachmarz algo
    max_iteration = 50000;
    precision = 0.0001;
    [m, n] = size(A);       
    X = zeros(n, 1);

    history_values = zeros(m, n); % points of the previous iteration
    current_values = zeros(m, n); % point of the current iteration
    
    for i = 1:max_iteration
        j = 1 + mod(i-1, m);
        aj = A(j,:);
        X = X + pinv(aj) * (B(j) - dot(aj,X));  % Kacmarz formula
        current_values(j, :) = X; % we are at this point of cycle     
        if (j == m) % if all equations are done check we are in the cycle
            if isequal(current_values, history_values)     
                break;
            end
        end
        history_values(j, :) = X; 
        if (norm(A * X - B) <= precision)
            disp('Solution have founded earlier then the cycle');
            break
        end
    end
    
end

