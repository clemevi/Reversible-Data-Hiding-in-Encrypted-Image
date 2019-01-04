function M_dec = ImageDecryption(M, K)
%CLEMENTE
%IMAGEDECRYPTION:
% data ua matrice di interi M e una chiave K, restituire la decifratura di
% M utilizzando lo streamcipher usato per la cifratura.

%get Image size
[row, col] = size(M);
n = row*col*8;

%get pseudorandom bit string by streamcipher (trivium)
pseudorandom_bit = trivium(n,K);
%separeted bit to group of 8 bit (int)
pad = vec2mat(pseudorandom_bit, 8);
%convert bit to int
pad_int = (bin2dec(int2str(pad)))';

%convert vector obateined by trivium to matrix
mat_bit = vec2mat(pad_int, col);

%do bit-wise xor beteween Image and trivium output
M_dec = bitxor(M , uint8(mat_bit));

end