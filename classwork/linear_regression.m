clc, clearvars;
close all;
xs = [7,1,10,5,4,3];
ys = [2,9,2,5,7,11];

xys = xs.*ys;
sumxs = sum(xs);
sumys = sum(ys);
xsqs = xs.^2;

n = length(xs);

m = (sum(xys) - (sumxs*sumys)/n)/(sum(xsqs)-((sumxs)^2/n));

b = (sumys/n) - m*(sumxs/n);

syms x

fx = m*x+b;

fplot(fx, [-5,15]);

hold on

plot(xs,ys, "*", LineWidth=2)

evalYs = double(subs(fx, x, xs));

avg_y = mean(ys);

v2 = 1 - (sum((ys-evalYs).^2)/sum((ys - avg_y).^2));

fn = fx + v2;

hold on 
fplot(fn, Color="green");
hold on

p = polyfit(xs,ys, 1)