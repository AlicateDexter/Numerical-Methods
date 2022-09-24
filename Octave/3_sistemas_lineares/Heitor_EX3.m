clc;
clear all;
close all;

% ATIVIDADE 3: Resolva o seguinte sistema com
% decomposição LU usando o método de Crout.

M = dlmread('matriz_EX3.txt', ' ');

A = M(:, 1:3);
b = M(:, 4);

[L, U] = lu_factorization(A)

y = progressive_lu(L, b)

x = regressive_lu(U, y)


