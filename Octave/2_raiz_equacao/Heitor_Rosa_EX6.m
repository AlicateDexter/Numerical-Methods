clc;
clear all;
close all;


%Atividade 6: Utilizando o método da secante calcule a raíz da equação
% x^2 + x – 6 = 0, sendo x0 = 1,5 e x1 = 1,7.

f = @(x) x.^2 + x - 6;

[root res] = secant(f, [1.5 1.7]);

printf('A raíz da equação é %.1f', root);

figure(1);
plot(res, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');

set(0, "defaultaxesfontsize", 20)


