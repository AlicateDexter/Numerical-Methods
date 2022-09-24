function resp = euler(f, x, iv, h);
  resp = iv + h * f(x, iv);
