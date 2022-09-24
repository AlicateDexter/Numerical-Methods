function I = simps13(x, y);

  n = length(x);
  %printf('%.d \n %.d \n\n', n, length(y))

  w = x(end) - x(1);

  int = y(1) + y(end);

  for i = 2:n-1;

    if rem(i, 2) == 0;
      int = int + 4 * y(i);
    else
      int = int + 2 * y(i);

    endif

endfor

I = w * (int/(3 * (n - 1)));


