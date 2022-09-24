clc;
clear all;
close all;

% Implemente o método de Jacobi e utilize para resolver o sistema:
% Sendo x0 = (0.7, −1.6, 0.6),  ε = 10−2. Como critério de
% parada utilize o erro relativo.

M = dlmread('matriz_EX7.txt', ' ');

A = M(:, 1:3);
b = M(:, 4);

x0 = [0.7, -1.6, 0.6]';

[res x]  = gauss_jacobi(A, b, x0, eps=0.01, crit = 'rel_error');

printf('Solução do sistema: \n\n')
disp(x)

set(0, 'defaultaxesfontsize', 20);

figure(1);
plot(res, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');
