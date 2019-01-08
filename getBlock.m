function [B] = getBlock(M, s, i, j)
%getBlock return the k block of M matrix bidimensional image, s is the dimension of blocks.
%M dimensions must be divisible by s

h = size(M, 1);
w = size(M, 2);
linear_size = h*w;
if mod(linear_size, s)~=0
   fprintf(">>>>>>>>>>Dimension of image M is not divisible by s.<<<<<<<<<<\n");
   return;
end

rows=h/s;
cols=w/s;


if (i < 0 || i > rows - 1)
    fprintf(">>>>>>>>>>Invalid index i.<<<<<<<<<<\n");
    return;
end
if (j < 0 || j> cols - 1)
    fprintf(">>>>>>>>>>Invalid index j.<<<<<<<<<<\n");
    return;
end

%get B block from 2D coordinates
B = M(i*s+1 : i*s+s, j*s+1 : j*s+s);


end

