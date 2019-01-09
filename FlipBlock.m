function Bflip = FlipBlock(B,Kh,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% ÃƒÂ¨ uguale a b. Restituire la matrice con i bit flippati.


%%inizializzo lo streamcipher con la 
%%chiave Kh richiamando la funzione
%%PRGA
%tic
[M,N] = size(B);
l = ((M*N)/8)+1;
r = mod(M*N,8);
pad_int = PRGA(Kh,l);
pad = de2bi(pad_int, 8);
pad = pad(1:end-(8-r));
pad = reshape(pad,[M,N]);
%time_pad = toc
%%Scorro streamcipher e se l'iesimo elemento
%%ÃƒÂ¨ uguale a b allora flippo gli ultimi 3 bit dell'iesimo elemento di B
%tic;
for i=1:M
    for j=1:N
        if pad(i,j) == b
            B(i,j) = bitxor(B(i,j),7);
        end
    end
end
%time_for = toc
Bflip = uint8(B);

end

