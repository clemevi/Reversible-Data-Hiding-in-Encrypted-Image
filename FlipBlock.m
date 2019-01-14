function Bflip = FlipBlock(B,pad,b)
%Input: Two-dimensional matrix, Two-dimensional matrix, Integer
%Output: Two-dimensional matrix

%Given a matrix of integers B, which corresponds to a block, a pad matrix containing pseudo-random numbers
%and a bit b, if b is equal to zero, the pad is denied, multiply the pad (or pad denied) by 7 (which in
%the bitwise XOR will be 00000111 so that only the last 3 bits will be flipped) in order to have 7 where 
%there was 1 (pixel of the set S1) and 0 there where there was 0 (pixel of the S0 set) perform a bitwise
%XOR between the block and the modified pad


if(b==0)
    pad = uint8(not(pad));
end

pad = pad*7;

Bflip = bitxor(B,pad);



end

