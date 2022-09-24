function [INV L U] = inverse_lu(A)
  n = length(A);
  IND = eye(n);

  [L, U] = lu_factorization(A);

  INV = zeros(n, n);

  for i=1:n;
    b = IND(:, i);

    y = progressive_lu(L, b);
    x = regressive_lu(U, y);

    INV(:, i) = x;

  endfor

