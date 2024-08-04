clear,clc 
x=[3 4.5 7 9];
 y=[2.5 1 2.5 0.5]; 
hold on 
plot(x,y,'o') 
z=linspace(x(1),x(end),100); 
L=interp1(x,y,z,'spline');
 plot(z,L,'r') 
%Y=spline(x,y,5)
 %plot(5,Y,'*b') 
axis([x(1),x(end),min(y)-1,max(y)+1])
