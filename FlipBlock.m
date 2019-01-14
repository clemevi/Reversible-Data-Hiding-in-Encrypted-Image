function Bflip = FlipBlock(B,pad,b)
%FLIPBLOCK
% Data una matrice di interi B, una chiave Kh e un bit b, inizializzare
% lo streamcipher con la chiave Kh, flippare gli ultimi 3 bit 
% dell'iesimo elemento di B se l'i-esimo elemento dato dallo streamcipher
% ÃƒÂ¨ uguale a b. Restituire la matrice con i bit flippati.

%%Scorro streamcipher e se l'iesimo elemento
%%ÃƒÂ¨ uguale a b allora flippo gli ultimi 3 bit dell'iesimo elemento di B

% [M,N] = size(B);
% for i=1:M
%     for j=1:N
%         if pad(i,j) == b
%             B(i,j) = bitxor(B(i,j),7);
%         end
%     end
% end

% tic

if(b==0)
    pad = uint8(not(pad));
end

pad = pad*7;

Bflip = bitxor(B,pad);


% Bxor = bitxor(B,7);
% notpad = uint8(not(pad));
% if(b)
%     Bflip = (notpad.*Bxor)+(pad.*B);
% else
%     Bflip = (pad.*Bxor)+(notpad.*B);
% end
% time_now = toc
% 
% Bflip = uint8(Bflip);



end

