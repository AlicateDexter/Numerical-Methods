clc;
clear all;
close all;

% ATIVIDADE 1: Um exemplo de um problema na engenharia elétrica que requer
% de um sistema de equações. Usando a lei de Kirchhoff, as correntes a solução
% i1, i2, i3, i4 podem ser determinadas com a solução do seguinte sistema
% de quatro equações (Apresentado no arquivo importado).
% Utilize o método de Gauss para resolver.


M = dlmread('matriz_EX1.txt', ' ');


% Para testar Pivotamento
aux = M(1, :);
M(1, :) = M(4, :);
M(4, :) = aux;

A = M(:, 1:4);
b = M(:, 5);

[Ab x] = pivot_gauss(A, b);

printf('Soluções do Sistema: \n\n')
for i = 1:4;
  printf('i%d = %f\n', i, x(i));
endfor




