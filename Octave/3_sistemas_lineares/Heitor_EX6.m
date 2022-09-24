clc;
clear all;
close all;

% ATIVIDADE 6: Resolver o sistema abaixo utilizando o
% método de Gauss-Seidel com valor inicial (0, 0, 0)
% erro absoluto como critério de parada.


M = dlmread('matriz_EX6.txt', ' ');

A = M(:, 1:3);
b = M(:, 4);

x0 = [0.; 0.; 0.];

[res x]  = gauss_seidel(A, b, x0, eps=0.005, crit = 'abs_error');

% Solução não convergiu, uma vez que não está diagonalmente dominante.
% Para garantir convergência, troca-se a linha 1 pela linha 2.

aux = A(1,:);
A(1,:) = A(2,:);
A(2,:) = aux;

aux = b(1);
b(1) = b(2);
b(2) = aux;

[res x]  = gauss_seidel(A, b, x0, eps=0.005, crit = 'abs_error');

printf('Solução do sistema: \n\n')
disp(x)

set(0, 'defaultaxesfontsize', 20);

figure(1);
plot(res, '-o');
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método');
