%Problema fuerzas estructura reticulada
%Incógnitas F1 F2 F3 F4 F5 F6 F7 H V1 V2

%Coeficientes:
fac = pi/180;

F1 = [(sin(45*fac)), (cos(45*fac)), (-sin(45*fac)), (-cos(45*fac)), 0, 0, 0, 0, 0, 0];
F2= [0 1 0 0 0 -1 0 0 0 0];
F3= [0 0 -sin(70*fac) cos(70*fac) sin(70*fac) -cos(70*fac) 0 0 0 0];
F4= [0 0 0 1 0 0 0 -1 0 0];
F5= [0 0 0 0 sin(60*fac) cos(60*fac) -sin(60*fac) -cos(60*fac) 0 0];
F6= [0 0 0 0 0 0 -sin(70*fac) cos(70) sin(70) -cos(70)];
F7= [0 0 0 0 0 0 0 0 0 -1];
H= [0 1 0 0 0 0 0 0 0 0];
V1= [1 0 0 0 0 0 0 0 0 0];
V2= [0 0 0 0 0 0 0 0 1 0];

% Sistema Ax=b
A = [
    0  1  0  0  0  0  0  0 1 0;  % Node 1 (Vertical)
    0  0  0  0  0  0  1 0  0 0;  % Node 1 (Horizontal)
    0  -1 -sind(70)  0  0  0  0 -cosd(70) 0 0; % Node 2 (Vertical)
    0  0 -cosd(70)  0  1 0 0 sind(70) 0 0;  % Node 2 (Horizontal)
    0 0 sind(70) sind(60) 0 0 0 cosd(70) 0 0; % Node 3 (Vertical)
    0 0 0 0 -cosd(70) 0 1 sind(70) 0 0; % Node 3 (Horizontal)
    0 0 0 0 -sind(60) -sind(60) 0 0 0 0; % Node 4 (Vertical)
    0 0 0 0 0 cosd(60) 0 cosd(60) 0 0; % Node 4 (Horizontal)
    0 0 0 0 0 0 sind(70) 0 -1 0; % Node 5 (Vertical)
    0 0 0 0 0 0 0 cosd(70) 0 -1; % Node 5 (Horizontal)
];
b= [0 0 250 0 0 0 250 0 0 0]'

%Método de Gauss parcial

function [X ] = gauss(A,B)
    
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
x = zeros(n,1)
x = gauss(A,b)