function spline_lin(X,Y,xinter)
    n=length(X);

    for k=1:n-1
        m = (Y(k+1)-Y(k))/(X(k+1)-X(k)); %pendiente
        b = Y(k)-m*X(k);

        if b>0
            fprintf('\n %fx + %f \t para x en [%.3f, %.3f]',m,b,X(k),X(k+1))
        elseif b<0
            fprintf('\n %fx - %f \t para x en [%.3f,%.3f]',m,abs(b),X(k),X(k+1))
        else
            fprintf('\n %fx \t \t para x en [%.3f, %.3f] \n',m,X(k),X(k+1))
        end

        if X(k) < xinter && xinter < X(k+1)
            fx = m*xinter + b;
            fprintf('\n Interpolacion de %f: %f',xinter,fx);
        end
        
    end
    
    fprintf('\n\n')
    plot(X,Y,'*k',X,Y)

end

% Datos extraídos de la tabla
temperatura = [100, 150, 200, 250, 300, 350, 400, 450, 500];
volumen_especifico = [1.6958, 1.9364, 2.1720, 2.4066, 2.6406, 2.8761, 3.1030, 3.3397, 3.5665];
energia_interna = [2506.7, 2582.8, 2658.4, 2733.7, 2808.4, 2882.6, 2957.0, 3031.5, 3113.6];
entropia = [2676.2, 2767.4, 2857.3, 2946.3, 3034.8, 3122.6, 3210.3, 3297.8, 3488.1];

temp = temperatura(1):25:temperatura(end)
interp1(temperatura, volumen_especifico,temp)
interp1(temperatura, energia_interna, temp)
interp1(temperatura, entropia, temp)

% spline_lin(temperatura, volumen_especifico, 25)
% hold on
% spline_lin(temperatura, energia_interna, 25)
% hold on
% spline_lin(temperatura, entropia, 25)
% hold on
% 
% X = [-3 -1 1 2];
% Y = [4 2 -1 3];
% 
% spline_lin(X,Y,1.5);