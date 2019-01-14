function  flippedMatrix = Data_Embedding(data,M,Kh)
%Input: Bit string, Two-dimensional matrix, Char string
%Output: Two-dimensional matrix
%Given the bits to hide, an image and a key
%computes the size of an sxs block based on the image dimensions and the data to be inserted,
%computes a pad matrix of the same size as a block containing pseudo-random bit (getMaskPad function),
%for each image block z (getBlock) flips the block (FlipBlock) according to the pad and the z-th bit to insert
%rebuilds the image with the flipped blocks (setBlock)
[rows, cols] = size(M);
bit_num = size(data, 2);

if mod(rows*cols,bit_num)~= 0
    fprintf("#######################################################################################\n");
    fprintf(">>>>>>>>>>Dimension of image M is not divisible by lenght of data.<<<<<<<<<<\n");
    fprintf("#######################################################################################\n");
   return;
end

%computes the block size
s = sqrt(rows*cols/bit_num);

block_rows=rows/s;
block_cols=cols/s;

flippedMatrix = M;
z = 1;

%computes a pad matrix of the same size as a block containing pseudo-random bit
pad = getMaskPad(s,Kh);


for i=0:block_rows-1
    for j=0:block_cols-1 
    block = getBlock(M,s,i,j);
    flipped_block=FlipBlock(block, pad, data(z));
    z = z+1;
   
    flippedMatrix = setBlock(flippedMatrix, flipped_block, i,j);
    if z == bit_num+1
        break;
    end
    end
end


end

