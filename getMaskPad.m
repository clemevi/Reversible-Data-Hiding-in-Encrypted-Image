function pad = getMaskPad(s,Kh)
%%inizializzo lo streamcipher con la 
%%chiave Kh richiamando la funzione
%%PRGA per ottenere il pad

%get lenght of pad
l = ((s*s)/8)+1;
%get the remaining bits to add
r = mod(s*s,8);
%get pad
pad_int = PRGA(Kh,l);
%format the output
pad = de2bi(pad_int, 8);
pad = pad(1:end-(8-r));
pad = reshape(pad,[s,s]);

end

