clc;
clear all;
close all;

%Atividade 1: Localizar a raíz da equação f(x) = sqrt(x) - 5 * exp(-x)


g = @(x) sqrt(x);
h = @(x) 5 * exp(-x);

x = 0:0.001:5;

gg = g(x);
hh = h(x);

err = abs(gg - hh);
[root i] = min(err);

printf('Valor aproximado da raíz da Equação: %2.2f', x(i));

set(0, "defaultaxesfontsize", 20)
plot(x, gg);
hold on
plot(x, hh);
hold on
plot(x(i), g(x(i)), 'markersize', 15);
hold on
plot([x(i) x(i)], [0 g(x(i))], 'linestyle', '--', 'color', 'k');
plot([0 x(i)], [g(x(i)) g(x(i))], 'linestyle', '--', 'color', 'k');
legend({'g(x)', 'h(x)'})




