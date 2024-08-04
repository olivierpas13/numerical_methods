% La funcion descomposicion_LU recibe dos parametros
% Matriz A, parametro de tipo matriz cuadrada, correspondiente
% a los coeficientes dependientes
% Matriz B, parametro de tipo fila o columna con longitud igual a las
% filas de la matriz A que corresponde a los coeficientes independientes
% 
% Retorna una matriz X que contiene las soluciones
%
% Adicionalmente, la funcion se detiene en caso de haber un elemento
% nulo durante el proceso de descomposicion
%Tambien muestra las matrices L y U generadas por la descomposicion
function X = descomposicion_LU(A,B)
    n = length(A);
    U = A;
    L = eye(n); %Crea una matriz identidad
    
    for j=1:n-1
        for i=j+1:n
            %En caso de que el pivote sea cero
            if A(j,j) == 0
                max_value = max(A(:,j));
                [max_index] = find(A(:,j) == max_value);
                max_index = max_index(1);
                prev = A(j,:);

                A(j,:) = A(max_index,:);
                A(max_index,:) = prev;
            end

            %L(i,j) es el factor pivote actual de la fila
            L(i,j) = U(i,j)/U(j,j); %Acomodar los factores pivote
            U(i,:)=U(i,:)-L(i,j)*U(j,:); %Escalonamiento con el factor pivote
        end
    end
    
    %Analizar la matriz U, si esta llegase a tener una fila nula
    if all(U(n,:) == 0)
        disp("Error! Matriz con elemento nulo en su diagonal!");
        X = zeros(n,1);
        return
    end
    
    disp("Matriz L: ")
    disp(L)
    disp("Matriz U: ")
    disp(U)

    %Comprobar si B corresponde a la cantidad total de soluciones
    if(length(B) ~= n)
        disp("La matriz B tiene dimensiones diferentes!");
        X = zeros(n,1);
        return
    end
    
    %Asegurarse de que B sea un vector columna
    [fil,~] = size(B);
    if(fil ==1)
        B = B';
    end
    
    %Resolver el sistema y obtener las raices
    D = L\B;
    X = U\D;

end