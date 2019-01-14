function M_dec = ImageEncDec(M, K)
%Input: Two-dimensional matrix, Char array
%Output: Two-dimensional matrix
% Given an image M and a key K, return the encryption/decryption of M using
%a stream cipher initialized with the key k

%get Image size
[row, col] = size(M);
n = row*col;

%get pseudorandom bit string by streamcipher 
pad_int = parallel_PRGA(K, n, 4); %PARALLEL VERSION
%pad_int = PRGA(K, n); %SEQUENTIAL VERSION

%convert vector obateined by Streamcipher to matrix
mat_bit = vec2mat(pad_int, col);

%do bit-wise xor beteween Image and streamcipher output
M_dec = bitxor(M , mat_bit);

end