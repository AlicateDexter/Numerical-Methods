clc;
clear all;
close all;

% ATIVIDADE 5: Resolva o sistema linear pelo método de Gauss-Seidel
% com valor inicial (0, 0, 0) e eps = 0.05.

M = dlmread('matriz_EX5.txt', ' ');

A = M(:, 1:3);
b = M(:, 4);

x0 = [0.; 0.; 0.];

[res x]  = gauss_seidel(A, b, x0, eps=0.05, crit = 'abs_error');

printf('Solução do sistema: \n\n')
disp(x)

set(0, 'defaultaxesfontsize', 20);

figure(1);
plot(res, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');
