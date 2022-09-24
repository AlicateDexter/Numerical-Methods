function resp = RK4(f, x, iv, h);
  K1 = f(x, iv);
  K2 = f(x + 0.5 * h, iv + 0.5 * K1 * h);
  K3 = f(x + 0.5 * h, iv + 0.5 * K2 * h);
  K4 = f(x + h, iv + K3 * h);
  resp = iv + h * (K1 + 2 * K2 + 2 * K3 + K4) / 6;
