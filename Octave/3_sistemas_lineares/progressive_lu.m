function y = progressive_lu(L, b)
  n = length(b);

  y = zeros(n, 1);

  y(1) = b(1)/L(1, 1);

  for i=2:n;
    y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1, 1))/L(i, i);
  endfor

