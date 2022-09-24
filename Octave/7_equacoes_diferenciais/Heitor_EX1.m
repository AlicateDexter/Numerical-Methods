clc;
clear all;
close all;

% ATIVIDADE 1: Calcular a solução aproximada, pelo método da expansão de Taylor
% de 2ª ordem, da equação: y' = 3 * x ^ 2 + 2 * x + 1, y(0) = 2, Tomando h=0.1.
% Qual o valor de y(0.4)?

h = 0.1;
x = 0:h:0.4;
iv = 2;

Y = [iv];

for i=1:length(x)-1;
  iv = taylor2(@func1, @dfunc1, x(i), iv, h);
  Y = [Y ; iv];
endfor

Ya = ifunc1(x);

printf('Solução Série de Taylor: %.4f\n', Ya(end))

set(0, 'defaultaxesfontsize', 15);

figure(1);
plot(x, Y, 'o-')
hold on
plot(x, Ya, 'ro--')
legend(['Solução Numérica'; 'Solução Analítica'])
xlabel('x')
ylabel('y')
title('Resultados da Solução da EDO');
