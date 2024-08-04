Met_LU(5)

            % %En caso de que el pivote sea cero
            % if A(j,j) == 0
            %     max_value = max(A(:,j));
            %     [max_index] = find(A(:,j) == max_value);
            %     max_index = max_index(1);
            %     prev = A(j,:);
            % 
            %     A(j,:) = A(max_index,:);
            %     A(max_index,:) = prev;
            % end


                %Analizar la matriz U, si esta llegase a tener una fila nula
    % if all(U(n,:) == 0)
    %     disp("Error! Matriz con elemento nulo en su diagonal!");
    %     X = zeros(n,1);
    %     return
    % end


    %    if(length(B) ~= n)
    %     disp("La matriz B tiene dimensiones diferentes!");
    %     X = zeros(n,1);
    %     return
    % end
    % 

    %     %Asegurarse de que B sea un vector columna
    % [fil,~] = size(B);
    % if(fil ==1)
    %     B = B';
    % end
    % 