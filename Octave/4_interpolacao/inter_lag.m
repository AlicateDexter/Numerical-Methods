function Y = inter_lag(x, y, X);

    n = length(x);

    Y = 0;

    for i = 1:n;
      prod = 1;
      for j = 1:n;
        if (i != j);
          prod = prod .* (X - x(j)) ./ (x(i) - x(j));
        endif
      endfor
      Y = Y + prod .* y(i);
    endfor
