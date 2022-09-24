function [Y, fxd] = inter_new(x, y, X);
    n  = length(x);
    nn = n;
    fxd = zeros(n, n);
    fxd(:,1) = y;

    Y = fxd(1, 1);

    for i = 1:n-1;
      dy = y(2:nn) - y(1:nn-1);
      dx = x(i+1:n) - x(1:n-i);
      y = dy ./ dx;
      nn = length(y);
      fxd(1:n-i, i+1) = y;
    endfor

    aux = 1;

    for i = 1:n-1;
      aux = aux .* (X - x(i));
      Y = Y + fxd(1, i+1) * aux;
    endfor
