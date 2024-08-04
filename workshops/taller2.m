clc, clearvars;

function X = gauss_seidel(A,B,tol)
    %Comprobar si A es diagonal dominante
    n = length(A);
    X = zeros(n,1);
    for i=1:n
        suma=0;
        for j=1:n
            if i~=j
                suma = suma+abs(A(i,j));
            end
        end
        if abs(A(i,i)) < suma
            disp("La matriz no es diagonal dominante");
            return
        end
    end

    %Generación de matrices N y P
    N = zeros(n);
    P = zeros(n);

    for i=1:n
        N(i,i:end) = A(i,i:end);
        if i>=2
            P(i,1:i-1) = -1*A(i,1:i-1);
        end
    end
    
    %Asegurarse de que B sea un vector columna
    [fil,~] = size(B);
    if(fil ==1)
        B = B';
    end
    
    %Aplicación de la fórmula en el método iterativo
    iter = 0;
    Xprev = zeros(n,1);
    error = 1;

    while error > tol
        X = N\B + N\P*Xprev;

        if iter > 0
            %Cálculo de error con la norma
            error = norm(X-Xprev);
        end

        iter = iter+1;
        Xprev = X;
    end
    
end

function [X] = gauss(A,B)
    
    n = length(A);

    X = zeros(1,n);
    
    [rows, cols] = size(A);

    if rows ~= cols

        disp("Error, la matriz debe ser cuadrada")
        return
    end


    for k=1:n-1
        for i=k+1:n %Inicializar "i" una fila abajo del pivote
            l = A(i,k)/A(k,k); %Factor pivote
            A(i,:) = A(i,:) - l*A(k,:); %Operación para convertir a ceros la fila actual
            B(i) = B(i) - l*B(k); %Misma operacion para afectar la matriz B
        end
    end

    disp(A)
    
    X = zeros(n,1);

    for i=n:-1:1
         X(i) = (B(i)-A(i,i+1:n)*X(i+1:n))/A(i,i);
    end
end

function [X] = inversa(A,B)
    disp(" - Matriz inversa");
    disp(inv(A))
     X = inv(A) * B;
end

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
    disp(" - Matriz ampliada del Sistema:");
    A = [A B];
    disp(A);
    
    iter = 1;
    %Triangulacion Superior
    for k=1:n-1
        for i=k+1:n %Inicializar "i" una fila abajo del pivote
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
        end
    end
    %En caso de tener solucion unica realizar
    %Triangulacion Inferior
    %En caso de que la ultima fila, su pivote no sea 1
    if A(n,n) ~= 1
        A(n,:) = A(n,:)/A(n,n);
    end

    for k=n:-1:2
        for i=k-1:-1:1 %Inicializar "i" una fila arriba del pivote
            iter = iter+1;
            
            %Para este punto, el pivote siempre sera 1
            A(i,:) = A(i,:) - A(i,k)*A(k,:); %Operacion para convertir a ceros la fila actual
        end
    end
    disp(A)
    X = A(:,n+1);

end

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

% Valores constantes
R1 = 1;
R2= 1;
R3 = 2;
R4 = 1;
R5 = 2;
R6 = 4;
E1 = 23;
E2 = 29;

I1 = 0;
I2 = 0;
I3= 0;

circ = [
    (R1+R3+R4), R3, R4;
    R3, (R2+R3+R5), -R5;
    R4,  -R5,  + (R4+R5+R6);
];

X = [I1, I2, I3]';

B = [E1 E2 0]';

fprintf("Taller 2 Metodos Numericos\nMiembros \n- " + ...
    "Olivier Paspuel\n- Frederick Tipan\n- Carlos Hernandez" + ...
    "\n- Antonio Revilla\n\n");


fprintf("1.- La ley de kirchhoff " + ...
    "para el voltaje aplicado al " + ...
    "circuito que \nse muestra en la " + ...
    "figura produce el siguiente sistema de ecuaciones \n")
disp([circ, B])

disp("Metodo de Gauss");

gauss(circ, B)

disp("Metodo de Gauss Jordan")
gauss_jordan(circ, B)

disp("Metodo de la inversa")

inversa(circ,B)

disp("Metodo de Gauss-Seidel")
gauss_seidel(circ, B, 0.0001)

fprintf("2. Las tecnicas de calculo infinitesimal nos " + ...
    "dice que la siguiente integral \nse determina descomponiendo" + ...
    "la funcion en fracciones parciales.\n")

A=[1,1,1,0,1,0;-8,-7,-6,1,-9,1;22,16,12,-3,29,-9;-26,-16,-12,3,-39,29;21,15,11,-3,18,-39;-18,-9,-6,2,0,18];
B=[0,0,0,1,1,1]';
disp("El sistema a resolver es::")

disp([A,B])

disp("Metodo de Gauss")
gauss(A,B)
disp("Metodo de Guass Jordan")
gauss_jordan(A,B)
disp("Metodo de LU")
descomposicion_LU(A,B)
disp("Metodo Guass Seidel")
gauss_seidel(A,B, 0.001)