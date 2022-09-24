function dydx = func2(x, iv);

  res = @(ydot) x + 1/ydot - ydot;

  dydx = fsolve(res, iv);

