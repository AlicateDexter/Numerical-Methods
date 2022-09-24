function [res xn] = gauss_seidel(A, b, x0, eps=1e-8, crit = 'abs_error', max_iter=30)

  res = [];
  n = length(b);
  D = diag(A);
  A = A - diag(D);

  EPS = 1e-20;

  if crit == 'rel_error';

    func = @(xn, x0) max(abs((xn - x0)./(x0 + EPS)));

  else;
    func = @(xn, x0) max(abs(xn - x0));

  endif

  for j=1:max_iter;

    xn = x0;

    for i=1:n;
      xn(i) = (b(i) - (A(i, :) * xn))./D(i);
    endfor

    err = func(xn, x0);

    if err < eps;
      res = [res err];
      break
    endif

    res = [res err];

    x0 = xn;

  endfor

if j == max_iter;
  printf('Método não convergiu para %d iterações.\n\n', max_iter)
endif
