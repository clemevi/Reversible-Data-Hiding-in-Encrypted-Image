function  flippedMatrix = Data_Embedding(data,M,Kh)
%%Data una stringa di bit "data" , una matrice di interi M e una chiave Kh
%%Richiamare getblock e per ogni blocco:
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
z = 1;

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

