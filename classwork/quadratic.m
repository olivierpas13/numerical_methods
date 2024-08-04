
% -- INPUT VALUES --
% a is the quadratic coefficient
% b is the linear coefficient
% c is the constant coefficient
% -- RETURN VALUES --
% the function returns points calculated and
% plots the function


function [points] = quadratic(a,b,c, startV, endV)
   fn = @(x) (((x.^2).*a)+(x.*b) + c);
   points = fn(linspace(startV, endV));
   plot(points);