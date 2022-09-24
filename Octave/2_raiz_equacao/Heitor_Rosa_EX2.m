clc;
clear all;
close all;

% Atividade 2: Programe em Octave o método da Bisseção para a equação
% f(x) = xlog(x) – 1 com precisão ε = 1E-1.
% Mostre todas as iterações necessárias.

% Verifique se 4 iterações são suficientes para o critério de
% parada.

f = @(x) x.*log10(x) - 1;
xx = 0.1:0.5:5;

% Para que 4 iterações sejam suficientes, devesse obedecer a
% análise de convergência.

% n <= log2 (eps0/eps)
% eps0 => (2^n) * eps = (2^4) * 0.1
% eps0 => 1.6

% Pela análise gráfica, estimasse que a raíz esteja próxima de 2.25,
% logo, os intervalos escolhidos serão [-0.75, +0.75] em torno de 2.25.

i4 = [1.5 3.0];

[root1, res1] = bissect_root(f, i4, eps = 1e-1);

printf('A raíz da equação é %.1f', root1);

figure(1);
plot(xx, f(xx) + 1);
hold on
plot(xx, ones(length(xx)));
xlabel('Valor');
ylabel('Domínio');
xlim([0.1 4.5])
title('Escolha do intervalo');

figure(2);
plot(res1, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');

set(0, "defaultaxesfontsize", 20)
