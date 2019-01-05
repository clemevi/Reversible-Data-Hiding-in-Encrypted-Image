function Bflip = FlipBlock(B,Kh,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% è uguale a b. Restituire la matrice con i bit flippati.


%%inizializzo lo streamcipher con la 
%%chiave Kh richiamando la funzione
%%trivium
streamCipher = trivium(n,Kh);
[J,K] = size(streamCipher);

%%Scorro le due matrici e se l'iesimo elemento di streamcipher 
%%è uguale a b allora flippo gli ultimi 3 bit dell'iesimo elemento di B

for x=1:J
    for z=1:K
        if streamCipher(x,z) == b
           pixel = B(x,z);
           temp = bitget(pixel,1:3);
           temp2 = bitcmp(temp, 1:3);
           B(x,z) = temp2;
           Bflip(x,z) = B(x,z);
        else
           Bflip = B(x,z);
        end
    end

end

end

