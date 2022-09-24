clc;
clear all;
close all;

M = dlmread('dados_EX1.txt');

x = M(:, 1);
y = M(:, 2);

X = 16:2:112;

x1 = 105;
x2 = 48;

Y = inter_lag(x, y, X);
Y1 = inter_new(x, y, X);

y1 = inter_lag(x, y, x1);
y2 = inter_new(x, y, x2);

printf('a) valor da economia para a velocidade %3d: %.2f\n', x1, y1)

printf('b) valor da economia para a velocidade %3d: %.2f', x2, y2)

set(0, 'defaultaxesfontsize', 15);

figure(1);
plot(x, y, 'bo');
hold on;
plot(X, Y, 'r--');
hold on;
plot(x1, y1, 'marker', '+', 'markersize', 14);
title('Interpolação pelo Método de Lagrange')
xlabel('Velocidade (km/h)')
ylabel('Economia (km/litro)')
legend('Pontos Experimentais', 'Interpolação', 'E(105) = 9.9314')

figure(2);
plot(x, y, 'bo');
hold on;
plot(X, Y1, 'r--');
hold on;
title('Interpolação pelo Método de Newton')
xlabel('Velocidade (km/h)')
ylabel('Economia (km/litro)')
plot(x2, y2, 'marker', '+', 'markersize', 14);
legend('Pontos Experimentais', 'Interpolação', 'E(48) = 9.5909')

