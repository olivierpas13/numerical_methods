clc, clearvars;
temperatura = [100, 150, 200, 250, 300,400, 500];
volumen_especifico = [1.6958, 1.9364, 2.172, 2.406, 2.639, 3.1030, 3.565];
energia_interna = [2506.7, 2582.8, 2658.1, 2733.7, 2810.4, 2967.9, 3131.6];
entropia = [2676.2, 2776.4, 2875.3, 2974.3, 3074.3, 3278.2, 3488.1];
temp = temperatura(1):25:temperatura(end);
vol1 = interp1(temperatura, volumen_especifico,temp);
ener1 = interp1(temperatura, energia_interna, temp);
ent1 = interp1(temperatura, entropia, temp);

disp('Propiedades de vapor a 0.1MPa (Interp. lineal)')
fprintf('  Temp     v        u        h\n')
fprintf('  gra_C    m^3/kg   kJ/kg    kJ/kg\n')
for(i = 1:length(temp))
    fprintf('%6.0f %8.4f %8.1f %8.1f\n',temp(i), vol1(i), ener1(i), ent1(i))
end
vol3 = interp1(temperatura, volumen_especifico, temp,'spline');
ener3 = interp1(temperatura, energia_interna,temp, 'spline');
ent3 = interp1(temperatura, entropia, temp, 'spline');


disp('')%línea de espacio
disp('  Propiedades de vapor a 0.1MPa (Interp. cúbica)')
fprintf('  Temp     v        u        h\n')
fprintf('  gra_C    m^3/kg   kJ/kg    kJ/kg\n')
for(i = 1:length(temp))
    fprintf('%6.0f %8.4f %8.1f %8.1f\n',temp(i), vol3(i), ener3(i), ent3(i))
end
disp('')%línea de espacio

errVol = abs(vol1- vol3);
errEner = abs(ener1-ener3);
errEnt = abs(ent1-ent3);

fprintf(' E_Temp    E_v       E_u      E_h\n')
fprintf('  gra_C     m^3/kg     kJ/kg   kJ/kg\n')
for i = 1:length(temp)
    fprintf('%6.0f %9.4f %8.1f %8.1f\n',temp(i), errVol(i), errEner(i), errEnt(i))
end