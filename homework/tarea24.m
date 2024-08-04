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

fxpobs - 60;

% interp1(pobs, ings, "spline")

% 3 ejercicio

xs = [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6];
ys = [2.2874, 2.7726, 3.2768, 3.7979, 4.3327, 4.8759, 5.4209];
