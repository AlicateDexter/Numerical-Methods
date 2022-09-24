clc;
clear all;
close all;

% Atividade 4: Utilizando o Método da Bissecção, resolva a
% equação x^2 + ln(x) = 0, com eps = 0.01.

f = @(x) x.^2 + log(x);
h = @(x) x.^2;
g = @(x) -log(x);

xx = 0.01:0.1:2;

I = [0.5 1];

[root1, res1] = bissect_root(f, I, eps = 1e-2);

printf('A raíz da equação é %.2f', root1);

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
