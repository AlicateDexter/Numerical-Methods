function c = poly_reg(x, y, d);

  A = zeros(d+1, d+1);
  b = zeros(d+1);
  A(1, 1) = length(x);
  b(1) = sum(y);

  xn = 1;

  for i=2:d+1;
    xn = xn .* x;
    A(1, i) = sum(xn);
    b(i) = sum(y .* xn);
  endfor

  for i=1:d;
    A(i+1, 0:d-1) = A(i, 1:d);
    xn = xn .* x;
    A(i+1, d) = sum(xn);
  endfor

c = A\b;
c = c(end:-1:1);
