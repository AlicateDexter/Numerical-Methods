function [L U] = lu_factorization(A)
  [R C] = size(A);

  % Passo 2: Criação da matriz já com a diagonal 1.
  L = zeros(R, C);
  U = eye(R, C);

  % Passo 1: Definição dos primeiros coeficientes de L.
  % Passo 3: Definição dos primeiros coeficientes de U.
  L(:, 1) = A(:, 1);
  U(1, :) = A(1, :)/L(1, 1);

  for i=2:R;
    % Passo 4: Cálculo dos coeficientes restantes.

    for j=2:i;
      L(i, j) = A(i, j) - L(i, 1:j-1) * U(1:j-1, j);
    endfor

    for j=i+1:R;
      U(i, j) = (A(i, j) - L(i, 1:i-1) * U(1:i-1, j))/L(i, i);
    endfor

  endfor

