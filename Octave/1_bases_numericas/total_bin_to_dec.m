function decimal = total_bin_to_dec(num)

  if length(strfind(num, '.')) == 0;
    decimal = integer_bin_to_dec(num);

   else
    p = strfind(num, '.');
    i = num(1:p-1);
    f = num(p+1:end);

    i = integer_bin_to_dec(i);
    f = fractional_bin_to_dec(f);

    decimal = i + f;
  endif

end
