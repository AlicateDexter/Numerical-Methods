function binary = total_dec_to_bin(num)

  if num/fix(num) == 1;
    binary = integer_dec_to_bin(num);

   else
    num = num2str(num);
    p = strfind(num, '.');
    i = num(1:p-1);
    f = num(p:end);

    i = str2num(i);
    f = str2num(f);

    i = integer_dec_to_bin(i);
    f = fractional_dec_to_bin(f);

    binary = [i f];
  endif

end
