clc;
clear all;
close all;
format long;

% ATIVIDADE 1: A partir dos dados, determine a derivada primeira
% f ′(x) no ponto x = 0,399.

M = dlmread('dados_EX1.txt');
x = M(:, 1);
f = M(:, 2);


% a) Use a fórmula de diferença progressiva com três pontos.
p3df = (-3 * f(2) + 4 * f(3) - f(4)) / (2 * (x(2) - x(1)));


% b) Use a fórmula de diferença central com dois pontos.
c2df = (f(3) - f(1))/(2 * (x(2) - x(1)));


printf('Derivada de 0.399 para diferença progressiva de 3 pontos: %.15f\n', p3df)
printf('Derivada de 0.399 para diferença central de 2 pontos: %.15f\n', c2df)
