function [root res] = bissect_root(fun, bracket, eps = 1e-8, max_iter = 50);

  a = bracket(1);
  b = bracket(2);

  fa = fun(a);
  fb = fun(b);

  res = [];

  if fa * fb > 0;
    printf('Teorema de Bolzano não observado, convergência não garantida.');
  endif

  for i=1:1:max_iter

    root = (a+b)/2;
    fn = fun(root);

    if fn * fa > 0;
      fa = fn;
      a = root;

    else
      fb = fn;
      b = root;
    endif

    r = abs(a - b);

    if r < eps;
      res = [res r];
      break
    endif

    res = [res r];


  endfor

