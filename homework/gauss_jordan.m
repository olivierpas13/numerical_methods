clc, clearvars;

A = [
    -0.04 0.04 0.12;
    0.56 -1.56 0.32;
    -0.24 1.24 -0.28];
B = [3 1 0];

n = length(A);

for i = 1:n
    A(i,:) = A(i,:)/A(i,i);
end

disp(A)

for i = 1:n
    for j = 1:n
        % A(j, :) = A(j,:) - ()
        % disp(A(j,:))
        A(j,:) = A(j,:) - (A(i,i)*A(j,i));
    end
end

A