function x = regressive_lu(U, y)
  n = length(y);

  x = zeros(n, 1);

  x(n) = y(n) / U(n, n);

  for i=n-1:-1:1;

    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n, 1))./U(i, i);

  endfor
