clc;
clear all;
close all;

%ATIVIDADE 4: Determine a inversa da matriz.

A = dlmread('matriz_EX4.txt', ' ') ./ 5

[INV L U] = inverse_lu(A)

printf('Verificação da Propriedade A * inv(A) = I: \n\n');

disp(A * INV)
