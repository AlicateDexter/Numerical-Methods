function c = linear_reg(x, y)

  n = length(x);
  sum_xy = sum(x .* y);
  sum_x = sum(x);
  sum_x2 = sum(x .^ 2);
  sum_y = sum(y);

  c(1) = (sum_x2 * sum_y - sum_xy * sum_x) / (n * sum_x2 - sum_x ^ 2);
  c(2) = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x ^ 2);


