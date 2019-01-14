function bit_data = format_data_to_hide(string)
%Input:Characters string
%Output: Bit string
%Convert the char array to hide into bit string 
dec_data = uint8(string);
bit_data_to_reshape = de2bi(dec_data,8);
bit_data = reshape(bit_data_to_reshape,[1, size(bit_data_to_reshape,1)*8]);
end

