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
x = x0
found = 1;
filas_err = zeros(1,2)
for i=1:n
    suma=0;
    for j=1:n
        if i~=j
            suma = suma+abs(A(i,j));
        end
    end
    if abs(A(i,i)) < suma
        filas_err(1, found) = i;
        found = found + 1;
    end
end

if(found > 1)
    tmp = A(filas_err(1), :);
    A(filas_err(1), :) = A(filas_err(2), :);
    A(filas_err(2), :) = tmp;
end

N = zeros(n);
P = zeros(n);
for i=1:n
    N(i,i:end) = A(i,i:end);
    if i>=2
        P(i,1:i-1) = -1*A(i,1:i-1);
    end
end

iter = 0;
err = 1;
Xprev = zeros(n,1);
    while err > tol
    x = N\b + N\P*Xprev;
    if iter > 0
        err = norm(x-Xprev);
    end
    iter = iter+1;
        Xprev = x;
    end
disp('Comprobación b=A*x: ')
b= A*x
iter
err
end
