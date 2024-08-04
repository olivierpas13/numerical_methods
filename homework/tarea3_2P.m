function [X] = gauss(A,B)
    
    n = length(A);

    X = zeros(1,n);
    
    [rows, cols] = size(A);

    for k=1:n-1
        for i=k+1:n 
            l = A(i,k)/A(k,k); 
            A(i,:) = A(i,:) - l*A(k,:); 
            B(i) = B(i) - l*B(k); 
        end
    end
    
    X = zeros(n,1);

    for i=n:-1:1
         X(i) = (B(i)-A(i,i+1:n)*X(i+1:n))/A(i,i);
    end
end

function [X] = inversa(A,B)
     X = inv(A) * B;
end


function X = descomposicion_LU(A,B)
    n = length(A);
    U = A;
    L = eye(n);
    
    for j=1:n-1
        for i=j+1:n
            L(i,j) = U(i,j)/U(j,j); 
            U(i,:)=U(i,:)-L(i,j)*U(j,:); 
        end
    end
    
    if all(U(n,:) == 0)
        disp("Elemento nulo en la diagonal!");
        X = zeros(n,1);
        return
    end

    D = L\B;
    X = U\D;

end


gaussTimes = zeros(5,1);
luTimes = zeros(5,1);
invTimes = zeros(5,1);

disp("Calculo de eficiencia de los métodos");

disp("Se analizaron los métodos: Gauss parcial, LU e inversa en sistemas 3x3, 10x10, 30x30, 100x100 y 200x200")

disp("Para un sistema 3x3")
A = randi(5, 3)
B = randi(100, 3, 1)

disp("Metodo de Gauss");

tic
gauss(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
gaussTimes(1) = time;

disp("Metodo de LU");

tic
descomposicion_LU(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
luTimes(1) = time;

disp("Metodo de la inversa");

tic
inversa(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
invTimes(1) = time;

disp("Para un sistema 10x10")
A = magic(10)
B = randi(20, 10, 1)

disp("Metodo de Gauss");

tic
gauss(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
gaussTimes(2) = time;


disp("Metodo de LU");

tic
descomposicion_LU(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
luTimes(2) = time;

disp("Metodo de la inversa");

tic
inversa(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
invTimes(2) = time;

disp("Para un sistema 30x30")

A = randi(30, 30)
B = randi(30, 30, 1)

disp("Metodo de Gauss");

tic
gauss(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
gaussTimes(3) = time;

disp("Metodo de LU");

tic
descomposicion_LU(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
luTimes(3) = time;

disp("Metodo de la inversa");

tic
inversa(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
invTimes(3) = time;


disp("Para un sistema 100x100")

A = randi(50, 100)
B = randi(40, 100, 1)

disp("Metodo de Gauss");

tic
gauss(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
gaussTimes(4) = time;

disp("Metodo de LU");

tic
descomposicion_LU(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
luTimes(4) = time;

disp("Metodo de la inversa");

tic
inversa(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
invTimes(4) = time;

disp("Para un sistema 200x200")
A = randi(200, 200)
B = randi(50, 200, 1)

disp("Metodo de Gauss");

tic
gauss(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
gaussTimes(5) = time;

disp("Metodo de LU");

tic
descomposicion_LU(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
luTimes(5) = time;

disp("Metodo de la inversa");

tic
inversa(A,B);
time = toc;
fprintf("Tomó %d segundos \n", time);
invTimes(5) = time;

num_vars = [3, 10, 30, 100, 200];

% Plotting the data
figure;
hold on;
plot(num_vars, gaussTimes, '-o', 'DisplayName', 'Gauss');
plot(num_vars, luTimes, '-o', 'DisplayName', 'Descomposicion LU');
plot(num_vars, invTimes, '-o', 'DisplayName', 'Inversa');
hold off;

% Adding labels and title
xlabel('Numero de variables');
ylabel('Tiempo (segundos)');
title('Eficiencia de algoritmos');
legend('show');
grid on;
