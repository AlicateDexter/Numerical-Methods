clc;
clear all;
close all;

% ATIVIDADE 2: Determine a decomposição LU da matriz a
% usando o método de Crout.

A = dlmread('matriz_EX2.txt', ' ')

% Fatorização LU
[L U] = lu_factorization(A)


% Conferindo Fatorização

printf('Conferindo Fatorização (A - L * U): \n\n')
disp(A - L * U);




