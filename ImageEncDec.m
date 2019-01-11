function M_dec = ImageDecryption(M, K)
%IMAGEDECRYPTION:
% Given a matrix of integers M and a K key, 
% return the decryption of M using the 
% streamcipher used for encryption.

%get Image size
[row, col] = size(M);
n = row*col;

%get pseudorandom bit string by streamcipher 
pad_int = parallel_PRGA(K, n, 4); %PARALLEL VERSION
%pad_int = PRGA(K, n); %SEQUENTIAL VERSION

%convert vector obateined by Streamcipher to matrix
mat_bit = vec2mat(pad_int, col);

%do bit-wise xor beteween Image and trivium output
M_dec = bitxor(M , mat_bit);

end