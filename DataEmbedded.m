function  flippedMatrix = Data_Embedded(data,M,Kh)

%%Data una stringa di bit "data" , una matrice di interi M e una chiave Kh
%%Richiamare SplitImage e per ogni blocco:
%%Richiamare Flipblock dandogli in input l'iesimo bit della stringa "data"
%%Restituire la matrice M con i bit flippati
[rows, cols] = size(M);
bit_num = size(data, 2);

if mod(rows*cols,bit_num)~= 0
    fprintf(">>>>>>>>>>Dimension of image M is not divisible by lenght of data.<<<<<<<<<<\n");
   return;
end

s = sqrt(rows*cols/bit_num);
block_rows=rows/s;
block_cols=cols/s;

flippedMatrix = M;
%flippedMatrix = zeros(rows, cols);
z = 1;
for i=0:block_rows-1
    for j=0:block_cols-1 
    block = getBlock(M,s,i,j);
    flipped_block=FlipBlock(block, Kh, data(z));
    z = z+1;
    if z == bit_num
        break;
    end
%     if data(i+1)==0
%         flipped_block= zeros(s, s);
%     else
%         flipped_block= ones(s, s);
%         flipped_block= flipped_block.*255;
%     end
    flippedMatrix=setBlock(flippedMatrix, flipped_block, i,j);
    end
end



end

