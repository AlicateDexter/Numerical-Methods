clc;
clear all;
close all;

% Programe o Método da Falsa Posição e refaça as ATIVIDADES 1 a 4 agora
% utilizando a sua função para método da Falsa Posição.

f1 = @(x) x.*log10(x) - 1;
f2 = @(x) x.^3 - sin(x);
f3 = @(x) x.^2 + log(x);


I1 = [1.5 3.0];
I2 = [0.9 1.0];
I3 = [0.5 1.0];

[root1, res1] = regula_falsi(f1, I1, eps = 1e-1);
[root2, res2] = regula_falsi(f2, I2, eps = 1e-3);
[root3, res3] = regula_falsi(f3, I3, eps = 1e-2);

[root4, res4] = bissect_root(f1, I1, eps = 1e-1);
[root5, res5] = bissect_root(f2, I2, eps = 1e-3);
[root6, res6] = bissect_root(f3, I3, eps = 1e-2);


figure(1);
plot(res1, '-o');
hold on;
plot(res2, '-o');
hold on;
plot(res3, '-o');
hold on;
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método (Falsa Posição)');
legend('f1', 'f2', 'f3');

figure(2);
plot(res4, '-o');
hold on;
plot(res5, '-o');
hold on;
plot(res6, '-o');
hold on;
xlabel('Iterações');
ylabel('Resíduo');
title('Convergência do método (Bissecção)');
legend('f1', 'f2', 'f3');
