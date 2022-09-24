clc;
clear all;
close all;

% Atividade 3: Utilizando o Método da Bissecção, resolva a equação
% x^3 – sen(x) = 0, com eps = 0.001.

f = @(x) x.^3 - sin(x);
h = @(x) x.^3;
g = @(x) sin(x);

xx = 0:0.01:1;

I = [0.9 1];

[root1, res1] = bissect_root(f, I, eps = 1e-3);

printf('A raíz da equação é %.3f', root1);

figure(1);
plot(xx, h(xx));
hold on
plot(xx, g(xx));
xlabel('Valor');
ylabel('Domínio');
title('Escolha do intervalo');


figure(2);
plot(res1, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');

set(0, "defaultaxesfontsize", 20);
