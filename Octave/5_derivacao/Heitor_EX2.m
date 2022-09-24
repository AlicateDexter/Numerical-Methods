clc;
clear all;
close all;
format long;

% ATIVIDADE 2: Os dados a seguir mostram a população por milhões
% do Nepal em anos selecionados entre 1980 e 2005. Calcule
% a taxa de crescimento da população para o ano de 2005.

M = dlmread('dados_EX2.txt');
x = M(:, 1);
f = M(:, 2);


% a) Use a fórmula de diferença regressiva com dois pontos.
r2df = (f(6) - f(5)) / (x(6) - x(5));

% b) Use a fórmula de diferença regressiva com três pontos.
r3df = (3* f(6) - 4 * f(5) + f(4))/(2 * (x(6) - x(5)));


% c) Usando a inclinação em 2005 obtida na letra (b), aplique
% a fórmula de diferença central com dois pontos para
% extrapolar e prever a população no ano de 2010.


% f'(x) = (f(x+h) - f(x-h)) / (2 * h);
% 2 * h * f'(x) = f(x+h) - f(x-h);
% f(x+h) = f(x-h) + 2 * h * f'(x);
% f(2010) = f(2000) + 10 * f'(2005);

f2010 = f(5) + 10 * r3df;


printf('Taxa Populacional de 2005 para diferença regressiva de 2 pontos: %.3f\n', r2df)
printf('Taxa Populacional de 2005 para diferença regressiva de 3 pontos: %.3f\n', r3df)
printf('Extrapolação da População em 2010: %.2f\n', f2010)


set(0, 'defaultaxesfontsize', 15);


figure(1);
plot(x, f, '*-')
hold on
plot([x(6) 2010], [f(6) f2010], 'r*--')
ylim([10 35])
legend(['Dados Populacionais'; 'Extrapolação'])
xlabel('Anos')
ylabel('População por milhões')
title('População de Nepal ao longo dos anos');
