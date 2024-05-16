%%%% Universidad de las Fuerzas Armadas ESPE
%%%% Metodos Numéricos
%%%% Autor: Olivier Paspuel
%%%% Clase 1
% Primer cálculo

clc, clearvars;

% first value;
a = 6;
% second value;
b = 7;
r = (a*b + b^2)/log10(100);

%% Segundo problema
% 1. Una bola de 4kg cuelga de una cuerda (de masa despreciable) del techo
% de un ascensor. Calcular la tensión de cuerda en cada uno de los casos
% siguientes  (g = 10 m/s²)

clc, clearvars;

masaBola = 4;
g = 10;

% a. Cuando acelera hacia arriba a razón de 3 m/s²

acel_a = 3;
    % T = p + ma;
p = masaBola * g;
ma = masaBola * acel_a;
T = p + ma;
disp(T);


% b. Cuando se mueve con velocidad constante

% T = p + ma;
ma2 = (masaBola * 0);
T2 = p + ma2;
disp(T2);

% c. Cuando frena disminuyendo su velocidad a razón de 3 m/s²
% T - mg = ma
ma3 = masaBola * (-3);
T3 = p + ma3;
disp(T3);


% d. Cuando se rompe el cable que sostiene al ascensor y este cae libremente

T4 = (masaBola * g) - (masaBola * g);
disp(T4)

