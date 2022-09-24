clc;
clear all;
close all;


% ATIVIDADE 2: Seja a Equação diferencial y' = x + 1/y', y(1) = 0.5,
% Estime y(2) considerando h=0.2. Calcule pelos três métodos: Euler, RK2 e RK4.

h = 0.2;
x = 1:h:2;
iv = 0.5;

iv1 = iv2 = iv4 = [iv];
Y1 = Y2 = Y4 = [iv];

for i=1:length(x)-1;

  iv1 = euler(@func2, x(i), iv1, h);
  iv2 = RK2(@func2, x(i), iv2, h);
  iv4 = RK4(@func2, x(i), iv4, h);

  Y1 = [Y1 ; iv1];
  Y2 = [Y2 ; iv2];
  Y4 = [Y4 ; iv4];

endfor

printf('Solução Euler: %.4f\n', Y1(end))
printf('Solução RK2: %8.4f\n', Y2(end))
printf('Solução RK4: %8.4f\n', Y4(end))

set(0, 'defaultaxesfontsize', 15);

figure(1);
plot(x, Y1, 'ro--')
hold on
plot(x, Y2, 'k^--')
hold on
plot(x, Y4, 'bo--')
hold on
legend(['Euler'; 'RK2'; 'RK4'])
xlabel('x')
ylabel('y')
title('Resultados da Solução da EDO');
