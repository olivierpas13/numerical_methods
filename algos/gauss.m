% La funcion recibe dos parametros
% Matriz A, parametro de tipo matriz cuadrada, ejemplo [1 2; 3 4] que
% contiene los coeficientes dependientes
% Matriz B, parametro de tipo fila con longitud igual a las filas de la
% matriz A que corresponde a los coeficientes independientes, ejemplo [19 20];
% 
% Retorna una matriz X que contiene las soluciones;


function [X] = gauss(A,B)
    
    n = length(A);

    X = zeros(1,n);
    
    [rows, cols] = size(A);

    if rows ~= cols

        disp("Error, la matriz debe ser cuadrada")
        return
    end

    %Triangulacion Superior de la Matriz
    for k=1:n-1
        for i=k+1:n %Inicializar "i" una fila abajo del pivote
            %En caso de que el pivote sea cero
            if A(k,k) == 0
                max_value = max(A(:,k));
                [max_index] = find(A(:,k) == max_value);
                max_index = max_index(1);
                prevA = A(k,:);
                prevB = B(k);

                A(k,:) = A(max_index,:);
                A(max_index,:) = prevA;
                

                B(k) = B(max_index);
                B(max_index) = prevB;
            end
            l = A(i,k)/A(k,k); %Factor pivote
            A(i,:) = A(i,:) - l*A(k,:); %Operación para convertir a ceros la fila actual
            B(i) = B(i) - l*B(k); %Misma operacion para afectar la matriz B
        end
    end

    %Analizar en caso de que tenga soluciones infinitas o no tenga solución
    if all(A(n,:) == 0) && all(B(n) == 0)
        disp("El sistema tiene infinitas soluciones");
        return
    end

    if all(A(n,:) == 0) && all(B(n) ~= 0)
        disp("El sistema no tiene soluciones");
        return
    end


    X = zeros(n,1);

    for i=n:-1:1
         X(i) = (B(i)-A(i,i+1:n)*X(i+1:n))/A(i,i);
    end
end