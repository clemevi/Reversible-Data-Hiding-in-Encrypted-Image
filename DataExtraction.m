function [Bdec,bitData] = dataExtraction(M,Kh,s)

%%Richiamare SplitImage e per ogni blocco restituito: Richiamare due volte
%%FlipBlock (Con b=0 e b=1) per ottenere H1 e H2. Calcolare Fluttuazione di
%%H1 e H2, confrontarle e scegliere il minore. Ricostruire l'immagine di
%%partenza con le matrici e i bit scelti nel passaggio precedente

[row,cols] = size(M);
numBlock = (row*cols) / (s*s);
blockRow = cols / s;
blockCols = row / s;
bitData = zeros(1,numBlock);
Bdec = zeros(row,cols);
h=1;
for i = 0:blockRow-1
    for j = 0:blockCols-1
        %tic;
        block = getBlock(M,s,i,j);
        %time1 = toc
        %tic;
        H1 = FlipBlock(block,Kh,0);
        %time2 = toc
        H2 = FlipBlock(block,Kh,1);
        %tic;
        fluctH1 = calculateFluctuation(H1);
        %time3 = toc
        fluctH2 = calculateFluctuation(H2);
       
        if fluctH1 < fluctH2
            bitData(h) = 0;
            %tic;
            Bdec = setBlock(Bdec,H1,i,j);
            %time4 = toc
        else
            bitData(h) = 1;
            Bdec = setBlock(Bdec,H2,i,j);
        end
        
        h = h + 1;
    end          
end
 

end