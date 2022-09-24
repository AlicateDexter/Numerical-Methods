function [root res] = secant(fun, X, eps = 1e-3, max_iter = 50);

x0 = X(1);
x1 = X(2);

ZERO = 1e-20; % Evita divisão por zero para raízes muito próximas de zero.

res = [];

f0 = fun(x0);

  for i=1:1:max_iter;

    f1 = fun(x1);

    root = x1 - f1 * (x1 - x0)/(f1 - f0);

    r = abs((x0 - root)/(root + ZERO));

    if r < eps;
      res = [res r];
      break
    endif

    res = [res r];

    x0 = x1;
    x1 = root;

    f0 = f1;

endfor

if i == max_iter;
  printf('Método não convergiu para %d iterações.', max_iter);
endif
