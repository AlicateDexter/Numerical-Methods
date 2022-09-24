clc;
clear all;
close all;


% ATIVIDADE 1: Determine uma fórmula geral para o cálculo das integrais
% usando:
%(a) Regra dos Trapézios.
%(b) Regra 1/3 de Simpson
%(c) Considere os seguintes valores: a = c = e = 0; b = 0.5 , d =
% 1.0, f = 1.0 e as funções g(x, y) = y * exp(x); g(x, y, z) = (xy)^z.
% Calcule valor numérico de cada integral usando as fórmulas anteriores,
% com passo h1 = h2 = h3 = 0.5, para o método dos trapézios e h1 = 0.25
% e h2 = h3 = 0.5, para o método (1/3) de Simpson.


g1 = @(x, y) y .* exp(x);
g2 = @(x, y, z) (x .* y) .^ z;

a = 0;
b = 0.5;
c = 0;
d = 1;
e = 0;
f = 1;

xt = a:0.5:b;
yt = c:0.5:d;
zt = e:0.5:f;

xs = a:0.25:b;
ys = c:0.5:d;
zs = e:0.5:f;

[xxt1, yyt1] = meshgrid(xt, yt);
[xxs1, yys1] = meshgrid(xs, ys);

ft1 = g1(xxt1, yyt1);
fs1 = g1(xxs1, yys1);

[nty, ntx] = size(ft1);
[nsy, nsx] = size(fs1);
It = zeros(nty, 1);
Is = zeros(nsy, 1);

% Integração sobre x;
for i = 1:nty;
  It(i) = trapezoid(xt, ft1(i, :));
  Is(i) = simps13(xs, fs1(i, :));
endfor

% Integração sobre y;
I_trapz1 = trapezoid(yt, It);
I_simps1 = simps13(ys, Is);
I_real1 = integral2(g1, 0, 0.5, 0, 1);


[xxs2, yys2, zzs2] = meshgrid(xs, ys, zs);
[xxt2, yyt2, zzt2] = meshgrid(xt, yt, zt);

fs2 = g2(xxs2, yys2, zzs2);
ft2 = g2(xxt2, yyt2, zzt2);

[nsy, nsx, nsz] = size(fs2);
[nty, ntx, ntz] = size(ft2);

It = zeros(nty, ntx);
Is = zeros(nsy, nsx);

% Integração sobre z;
for i = 1:nty;
  for j = 1:ntx;

    It(i, j) = trapezoid(zt,  ft2(i, j, :));

  endfor
endfor

for i = 1:nsy;
  for j = 1:nsx;

    Is(i, j) = simps13(zs, fs2(i, j, :));

  endfor
endfor


% Integração sobre y;
IIt = zeros(ntx, 1);
IIs = zeros(nsx, 1);

for i = 1:ntx;

  IIt(i) = trapezoid(yt, It(:, i));

endfor

for i = 1:nsx;

  IIs(i) = simps13(ys, Is(:, i));

endfor

% Integração sobre x;
I_trapz2 = trapezoid(xt, IIt);
I_simps2 = simps13(xs, IIs);
I_real2 = integral3(g2, 0, 0.5, 0, 1, 0, 1);


%%RESULTADOS
printf('INTEGRAÇÃO PARA A FUNÇÂO "g(x, y) = y * exp(x)"\n\n')
printf('Regra do Trapézio: %6.4f\n', I_trapz1)
printf('1/3 de Simpson: %9.4f\n', I_simps1)
printf('"integral2": %12.4f\n\n\n', I_real1)

printf('INTEGRAÇÃO PARA A FUNÇÂO "g(x, y, z) = (x*y)^z"\n\n')
printf('Regra do Trapézio: %6.4f\n', I_trapz2)
printf('1/3 de Simpson: %9.4f\n', I_simps2)
printf('"integral3": %12.4f\n\n\n', I_real2)









