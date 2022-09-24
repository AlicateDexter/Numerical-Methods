function [Ab x] = pivot_gauss(A, b)

  Ab = [A, b];
  [R C] = size(Ab);

  % Eliminação Progressiva
  for j = 1:R-1;

    % Pivotamento
    [m k] = max(abs(Ab(j:end, j)));

    if m != abs(Ab(j, j));
      aux = Ab(j, :);
      Ab(j, :) = Ab(k, :);
      Ab(k, :) = aux;
    endif

    for i = j+1:R;

      fac = Ab(i, j)/Ab(j, j);
      Ab(i, j:end) = Ab(i, j:end) - fac * Ab(j, j:end);

    endfor
  endfor

  % Substituição Regressiva
  x = zeros(R, 1);
  x(R) = Ab(R, C)/Ab(R, C-1);

  for i = 1:R-1;
   x(R-i) = (Ab(R-i, C) - Ab(R-i,R-i+1:R)*x(R-i+1:R))/Ab(R-i, R-i);
  endfor
