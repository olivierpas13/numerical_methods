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

