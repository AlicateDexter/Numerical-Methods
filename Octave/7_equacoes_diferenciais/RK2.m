function resp = RK2(f, x, iv, h);
  K1 = f(x, iv);
  K2 = f(x + h, iv + K1 * h);
  resp = iv + h * 0.5 * (K1 + K2);
