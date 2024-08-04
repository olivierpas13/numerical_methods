function x=Met_LU(n)
format short
%construcción de la matriz A



A = zeros(n,n)
for i= 1:n
    for j =1:n
        if(i ~= j)
            A(i,j) = 1/(i+j-1)
        else
            A(i,i) = 3*i+1
        end
    end
end
A

b = zeros(n,1)

for i=1:n
    b(i) = 1;
end





%solución del sistema Ax=b con el método LU

    n = length(A);
    U = A;
    L = eye(n); 
    for j=1:n-1
        for i=j+1:n
            L(i,j) = U(i,j)/U(j,j);
            U(i,:)=U(i,:)-L(i,j)*U(j,:);
        end
    end
    
L
U

    

    %Resolver el sistema y obtener las raices
    D = L\B;
    X = U\D;



disp('Comprobación b=A*x: ')
b= A*X

disp('Solución: ')
%fprintf('  x =  ',)
X
end