function Bflip = FlipBlock(B,pad,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% ÃƒÂ¨ uguale a b. Restituire la matrice con i bit flippati.


if(b==0)
    pad = uint8(not(pad));
end

pad = pad*7;

Bflip = bitxor(B,pad);



end

