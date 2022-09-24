function [root res] = newton_raphson(fun, dfun, x0, eps = 1e-3, max_iter = 50);

ZERO = 1e-20; % Evita divisão por zero para raízes muito próximas de zero.

res = [];

  for i=1:1:max_iter

    root = x0 - fun(x0)/dfun(x0);

    r = abs((x0 - root)/(root + ZERO));

    if r < eps;
      res = [res r];
      break
    endif

    res = [res r];

    x0 = root;

endfor

if i == max_iter;
  printf('Método não convergiu para %d iterações.', max_iter);
endif
