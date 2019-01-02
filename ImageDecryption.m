function M_dec = ImageDecryption(M, K)
%CLEMENTE
%IMAGEDECRYPTION:
% data ua matrice di interi M e una chiave K, restituire la decifratura di
% M utilizzando lo streamcipher usato per la cifratura.

%get Image size
row, col = size(M);
n = row*col;

%get pseudorandom bit string by streamcipher (trivium)
pseudorandom_bit = trivium(n,K);

%convert vector obateined by trivium to matrix
mat_bit = vec2mat(pseudorandom_bit, col);

%do bit-wise xor beteween Image and trivium output
M_dec = bitxor(M , mat_bit);

end