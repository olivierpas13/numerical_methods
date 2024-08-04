format shortG

%% Método de Interpolación de Lagrange
function p = interpolacion_lagrange(datos)
    % datos es una matriz donde cada fila es [x, f(x)]
    xs = datos(:, 1);
    f = datos(:, 2);
    
    syms x;
    n = length(xs);
    p = 0;
    
    for i = 1:n
        l = 1;
        for j = 1:n
            if i ~= j
                l = l * ((x - xs(j)) / (xs(i) - xs(j)));
            end
        end
        p = p + f(i) * l;
    end
    
    p = expand(p);
end



% 1 ejercicio;
syms x;

fx = (x+1)/(3*x^2+2*x+1);

interv = linspace(0,5, 5);

ys = subs(fx, interv);

datos = [interv; ys]';

lagrange = interpolacion_lagrange(datos);

intervalo02 = 0:0.2:5;

ys02 = double(subs(fx, x, intervalo02));
ysL02 = double(subs(lagrange, x, intervalo02));

dif = abs(ys02 - ysL02);

plot(intervalo02, dif);

% 2 ejercicio

pobs = [25,50,75,100];
ings = [10,25,70,100];

datos = [pobs; ings]';
fxpobs = interpolacion_lagrange(datos);

double(subs(fxpobs, x, 60))

f = @(x) double(subs(fxpobs, x));
df = matlabFunction(diff(fxpobs, x)); 

x0 = 50; % Valor inicial
tolerancia = 1e-6; % Tolerancia
max_iter = 100; % Número máximo de iteraciones

for iter = 1:max_iter
    f_x0 = f(x0) - 60;
    df_x0 = df(x0);
    x1 = x0 - f_x0 / df_x0;
    
    if abs(x1 - x0) < tolerancia
        break;
    end
    
    x0 = x1;
end

disp(['Porcentaje de población correspondiente al 60% del ingreso: ', num2str(x1)]);



% 3 ejercicio
x = [1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000];
f_x = [2.2874, 2.7726, 3.2768, 3.7979, 4.3327, 4.8759, 5.4209];

n = length(x);
F = zeros(n, n);
F(:,1) = f_x';

for j = 2:n
    for i = 1:n-j+1
        F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x(i+j-1) - x(i));
    end
end

syms t;
P = F(1,1);
prod_term = 1;

for k = 2:4
    prod_term = prod_term * (t - x(k-1));
    P = P + F(1,k) * prod_term;
end
P = expand(P)
valor = double(subs(P, t, 1.05));
disp(['f(1.05) = ', num2str(valor)]);
