function range = getRange(M)
%Input: Two-dimensional matrix
%Output: Integers array
% given an image M returns the different lengths (in bits) 
% that can have the data to be hidden.
[m,n] = size(M);

div_m = divisors(m);
div_n = divisors(n);
div = intersect(div_m,div_n);

%To extract the data correctly, the minimum block size must be 32
mask = div>=32;

div = uint64(div(mask)) ;

range = (m*n)./(div.^2);

%To insert characters into the images, the lengths in bits must be divisible by 8
mask = mod(range,8)==0;

range = range(mask);

end

