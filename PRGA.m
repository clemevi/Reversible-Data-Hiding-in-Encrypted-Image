function [ key ] = PRGA( k, n )

S = KSA(k);

i = 0;
j = 0;
key = uint16([]);
%each iteration we will append one key value

while n> 0
    n = n - 1;
    i = mod( i + 1, 256);
    j = mod(j + S(i+1), 256);
    S([i+1 j+1]) = S([j+1 i+1]);
    K = S( mod(  S(i+1) + S(j+1)   , 256)  + 1  );
    key = [key, K];
    
    
end

key = uint8(key);

end

