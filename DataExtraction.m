function [Bdec,bitData] = dataExtraction(M,Kh,s)

%%Richiamare SplitImage e per ogni blocco restituito: Richiamare due volte
%%FlipBlock (Con b=0 e b=1) per ottenere H1 e H2. Calcolare Fluttuazione di
%%H1 e H2, confrontarle e scegliere il minore. Ricostruire l'immagine di
%%partenza con le matrici e i bit scelti nel passaggio precedente

[row,cols] = size(M);
numBlock = (row*cols) / (s*s);
blockRow = cols / s;
blockCols = row / s;
bitData = zeros(numBlock);
Bdec = zeros(row,cols);

for i = 0:blockRow-1
    for j = 0:blockCols-1
        
        block = getBlock(M,s,i,j);
        H1 = FlipBlock(block,Kh,0);
        H2 = FlipBlock(block,Kh,1);
        fluctH1 = calculateFluctuation(H1);
        fluctH2 = calculateFluctuation(H2);
    
        if fluctH1 < fluctH2
            bitData(i+j+1) = 0;
            Bdec = setBlock(Bdec,H1,i,j);
        else
            bitData(i+j+1) = 1;
            Bdec = setBlock(Bdec,H2,i,j);
        end
    end          
end
 

end