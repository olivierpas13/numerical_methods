% La funcion gauss_jordan recibe dos parametros
% Matriz A, parametro de tipo matriz cuadrada, correspondiente
% a los coeficientes dependientes
% Matriz B, parametro de tipo fila o columna con longitud igual a las
% filas de la matriz A que corresponde a los coeficientes independientes
% 
% Retorna una matriz X que contiene las soluciones;
%
% Adicionalmente, la funcion muestra todo el proceso de reduccion
% del proceso de Gauss Jordan

function [X] = gauss_jordan(A,B)
    %Reconocer que el tamaño de las matrices es el adecuado
    n = length(A);
    X = zeros(1,n);

    [n,m] = size(A);
    
    %Si la matriz no es cuadrada
    if n ~= m
        disp("Error, la matriz debe ser cuadrada")
        return
    end
    
    %Si las matrices A y B no
    %tienen las mismasd dimensiones
    m = length(B);
    if n ~= m
        disp("Error, las dimensiones de las matrices A y B no coinciden")
        return
    end

    
    %Algoritmo de Gauss Jordan
    %Asegurarse de que B sea un vector columna
    [fil,~] = size(B);
    if(fil ==1)
        B = B';
    end
    
    %Generar matriz Ampliada
    disp("Matriz ampliada del Sistema:");
    A = [A B];
    disp(A);
    
    disp("Proceso Gauss-Jordan:");
    iter = 1;
    %Triangulacion Superior
    for k=1:n-1
        for i=k+1:n %Inicializar "i" una fila abajo del pivote
            fprintf("Paso %d: \n",iter);
            iter = iter+1;
            
            %En caso de que el pivote sea cero
            if A(k,k) == 0
                max_value = max(A(:,k));
                [max_index] = find(A(:,k) == max_value);
                max_index = max_index(1);
                prev = A(k,:);

                A(k,:) = A(max_index,:);
                A(max_index,:) = prev;
            end
            
            %Convertir el pivote a 1 y afectar
            %sus filas
            if(A(k,k) ~= 1)
                 A(k,:) = A(k,:)/A(k,k);
            end
            l = A(i,k)/A(k,k); %Factor pivote

            A(i,:) = A(i,:) - l*A(k,:); %Operación para convertir a ceros la fila actual
            disp(A);
        end
    end

    %Analizar en caso de que tenga soluciones infinitas
    if all(A(n,:) == 0) && all(B(n) == 0)
        disp("El sistema tiene infinitas soluciones");
        return
    end
    
    %Analizar en caso de que no tenga solucion
    if all(A(n,:) == 0) && all(B(n) ~= 0)
        disp("El sistema no tiene soluciones");
        return
    end

    %En caso de tener solucion unica realizar
    %Triangulacion Inferior
    %En caso de que la ultima fila, su pivote no sea 1
    if A(n,n) ~= 1
        A(n,:) = A(n,:)/A(n,n);
    end

    for k=n:-1:2
        for i=k-1:-1:1 %Inicializar "i" una fila arriba del pivote
            fprintf("Paso %d: \n",iter);
            iter = iter+1;
            
            %Para este punto, el pivote siempre sera 1
            A(i,:) = A(i,:) - A(i,k)*A(k,:); %Operacion para convertir a ceros la fila actual
            disp(A);
        end
    end
    
    X = A(:,n+1);

end