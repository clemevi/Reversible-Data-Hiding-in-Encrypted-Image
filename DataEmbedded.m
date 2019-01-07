function  flippedMatrix = Data_Embedded(data,M,Kh)

%%Data una stringa di bit "data" , una matrice di interi M e una chiave Kh
%%Richiamare SplitImage e per ogni blocco:
%%Richiamare Flipblock dandogli in input l'iesimo bit della stringa "data"
%%Restituire la matrice M con i bit flippati

block = getBlock(M,s,k);
[i,j] = size(block);
l= size(data);

for x=1:i
    for y=1:j
        for z=1:l
        flip = FlipBlock(M,Kh,data(l));
        flippedMatrix(x,y) = flip;
        end
    end
end


end

