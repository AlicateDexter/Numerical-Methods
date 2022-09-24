clc;
clear all;
close all;

%Atividade 5: Determine a solução da equação 1/x − 2 = 0
% usando o método de Newton. Como ponto de partida,
%use: (a) x = 1,4 (b) x = 1 e (c) x = 0,4.


f  = @(x) 1./x - 2;
df = @(x) -1./(x.^2);

xx = 0.1:0.1:2;
nxx = -2:0.1:-0.1;

% O resultado da primeira iteração para estimativas acima de 1 será negativa.
% Com uma avaliação gráfica, vê-se que não há raízes reais para
% o domínio negativo, além disso, tanto a função como a derivada geram
% valores negativos no domínio negativo, ou seja, todas as iterações posteriores
% apenas gerarão valores negativos, implicando na divergência do método.

printf('(a): ');
x0 = 1.4;

[root res] = newton_raphson(f, df, x0);

% No ponto 1, a derivada possui o mesmo valor que a função, logo, aplicando
% Newton Raphson, o valor da próxima iteração é zero. Porém, zero NÃO
% pertence ao domínio da função, não sendo possível avaliá-la,
% implicando na divergência do método.

printf('\n(b): ');
x0 = 1.;

[root res] = newton_raphson(f, df, x0);

% Convergência garantida.

printf('\n(c): ');
x0 = .4;

[root res] = newton_raphson(f, df, x0);
printf('Raiz da Equação é %.2f para %d iterações', root, length(res))

set(0, "defaultaxesfontsize", 20)

figure(1);
plot(xx, f(xx));
hold on
plot(xx(5:end), df(xx(5:end)));
hold on
plot([xx(1) xx(end)],[0, 0], 'k--');
xlabel('Valor');
ylabel('Domínio');
title('Escolha da Estimativa Inicial')
legend('Função','Derivada');

figure(2);
plot(nxx, f(nxx));
hold on;
plot(nxx(5:end), df(nxx(5:end)));
hold on;
plot([nxx(1) nxx(end)],[0, 0], 'k--');
xlabel('Valor');
ylabel('Domínio');
ylim([-12 2]);
title('Avaliação do Domínio Negativo')
legend('Função','Derivada');




