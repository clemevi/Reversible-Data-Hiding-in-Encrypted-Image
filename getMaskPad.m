function pad = getMaskPad(s,Kh)
%Input: Integer, Char string
%Output: sxs matrix
%calculates a pad matrix of the same size as a block containing pseudo-random bits computed with PRGA
%as PRGA returns char, performs calculations to handle the discrepancy between s and the returned string

%get lenght of pad
l = uint64((floor((s*s)/8))+1);

%get the remaining bits to add
r = mod(s*s,8);

%get pad
pad_int = PRGA(Kh,l);

%format the output
pad = de2bi(pad_int, 8);
pad = pad(1:end-(8-r));
pad = reshape(pad,[s,s]);

end

