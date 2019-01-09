function char_secret = char_format_data(bit_secret)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
bit_secret_reshaped = reshape(bit_secret,[32 8]);
dec_secret = bi2de(bit_secret_reshaped);
char_secret = char(dec_secret)';
end

