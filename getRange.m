function range = getRange(M)
% given an image M returns the different lengths (in bits) 
% that can have the data to be hidden.
[m,n] = size(M);

div_m = divisors(m);
div_n = divisors(n);
div = intersect(div_m,div_n);

mask = div>=32;% & mod(div,8)==0;

div = uint64(div(mask)) ;


range = (m*n)./(div.^2);

end

