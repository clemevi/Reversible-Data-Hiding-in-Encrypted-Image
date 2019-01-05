function Bflip = FlipBlock(B,Kh,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% è uguale a b. Restituire la matrice con i bit flippati.


%%inizializzo lo streamcipher con la 
%%chiave Kh richiamando la funzione
%%trivium

[M,N] = size(B);
l = M*N;
streamCipher = trivium(l,Kh);
pad = vec2mat(streamCipher,N);

%%Scorro streamcipher e se l'iesimo elemento
%%è uguale a b allora flippo gli ultimi 3 bit dell'iesimo elemento di B

for x=1:M
    for z=1:N
        if pad(x,z) == b
           pixel = B(x,z);
           temp = bitget(pixel,1:3);
           temp2 = bitcmp(temp, 1:3);
           B(x,z) = temp2;
           Bflip(x,z) = B(x,z);
        else
           Bflip(x,z) = B(x,z);
        end
    end

end

end

