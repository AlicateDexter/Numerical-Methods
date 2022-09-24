function decimal = fractional_bin_to_dec(num)

  N = length(num);

  decimal = 0;

  for i=1:1:N;
        decimal = decimal + str2num(num(i)) * 2 ^ (-i);
  endfor

end
