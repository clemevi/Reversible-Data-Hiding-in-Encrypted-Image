function Bflip = FlipBlock(B,Kh,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% Ã¨ uguale a b. Restituire la matrice con i bit flippati.


%%inizializzo lo streamcipher con la 
%%chiave Kh richiamando la funzione
%%PRGA

[M,N] = size(B);
l = ((M*N)/8)+1;
r = mod(M*N,8);
pad_int = PRGA(Kh,l);
pad = de2bi(pad_int);
pad = pad(1:end-(8-r));
pad = reshape(pad,[M,N]);

%%Scorro streamcipher e se l'iesimo elemento
%%Ã¨ uguale a b allora flippo gli ultimi 3 bit dell'iesimo elemento di B

for i=1:M
    for j=1:N
        if pad(i,j) == b
           %%%%% flip bit %%%%
           %get 3 LSB of B(i,j)
           LSB = bitget(B(i,j),1:3);
           %complement LSB
           LSB_cmp = bitxor(LSB, [1 1 1]);
           B(i,j) = [LSB, bitget(B(i,j,4:8))];
        end
    end
end

Bflip = B;

end

