function resp = taylor2(f, df, x, iv, h);
    resp = iv + h * f(x, iv) + h^2 * df(x, iv) / 2;
