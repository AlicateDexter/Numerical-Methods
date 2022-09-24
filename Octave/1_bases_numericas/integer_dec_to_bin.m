function binary = integer_dec_to_bin(num)

    binary = '';

    while num > 0;
        r = mod(num, 2);
        num = fix(num / 2);
        binary = [num2str(r) binary]; 
    
    end
    
end