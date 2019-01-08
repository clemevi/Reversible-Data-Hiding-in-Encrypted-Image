function [ S ] = KSA( key )

key = char(key);
key = uint16(key);

key_length = size(key,2);
S=0:255;

j=0;
for i=0:1:255
    j =  mod( j + S(i+1) + key(mod(i, key_length) + 1), 256);
    S([i+1 j+1]) = S([j+1 i+1]);
end

end

