function binary = fractional_dec_to_bin(num, bits = 32)

    binary = '.';

    j = 1;

    while num > 0 && num * 2 ~= 1. && j < bits;
        num = num * 2;

        num = num2str(num);

        p = strfind(num, '.');
        i = num(1:p-1);
        f = num(p:end);
        binary = [binary num2str(i)];

        num = str2num(f);

        j = j + 1;

    end

    binary = [binary '1'];

end
