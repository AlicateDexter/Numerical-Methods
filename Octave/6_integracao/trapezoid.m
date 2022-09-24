function I = trapezoid(x, y);

  n = length(x);

  w = x(end) - x(1);

  int = y(1) + y(end);

  for i = 2:n-1;

    int = int + 2 * y(i);

  endfor

I = w * (int/(2 * (n - 1)));
