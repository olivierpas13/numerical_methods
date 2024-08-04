function [x,iter,err]=GauSei(A,b,x0,nm,tol)
%A es la matriz principal
%b es la matriz columna de terminos independientes
%x0 es la solucion supuesta con la que empieza la iteracion
    %es un vector columna
%nm es el numero de iteraciones
%tol es la tolerancia para el error
format short
%en esta parte se evalua si A es DDF (Diag. dominante por filas)
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



%Arreglo matriz si tiene 2 filas que no cumplen







%comprobación
disp('Comprobación b=A*x: ')
b=

end
