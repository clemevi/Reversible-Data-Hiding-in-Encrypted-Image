function [B] = getBlock(M, s, k)
%getBlock return the k block of M the image, s is the dimension of blocks.
%M dimensions must be divisible by k

%calculate rows and cols of image
h = size(M, 1);
w = size(M, 2);
linear_size = h*w;
if mod(linear_size, s)~=0
   fprintf(">>>>>>>>>>Dimension of image M is not divisible by index k.<<<<<<<<<<\n");
   return;
end
block_num =(h*w/(s*s));

%k can assume values from 0 to  block_num - 1
if (k < 0 || k > block_num - 1)
    fprintf(">>>>>>>>>>Invalid index k.<<<<<<<<<<\n");
    return;
end

%calculate number of clos and rows of blocks
col = w/s;
row = h/s;

%translate k in 2D coordinates
i = fix(k/col);
j = fix(k/row);

%get B block from 2D coordinates
B = M(i*s+1 : i*s+s, j*s+1 : j*s+s);
end

