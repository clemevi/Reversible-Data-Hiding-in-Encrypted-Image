%INPUT: l'originale e la decifrata (stesse dimensioni)
%OUTPUT: valore dell'energia media dell'errore.
%Error_rate: l'errore medio è calcolato solo sugli utlimi 3 bit di ogni pixel, in decimale (o anche sul valore intero del pixel)
%è la sommatoria della differenza al quadrato degli ultimi 3 bit di ogni pixel, diviso il numero di pixel

function E = Error_Rate(Mat1, Mat2)  
    
    [M,N] = size(Mat1);
    E = 0;
    for i=1:M
        for j=1:N
            E = E + (double(bi2de(bitget(Mat1(i,j),1:3)))-double(bi2de(bitget(Mat2(i,j),1:3))))^2;            
        end
    end
        
    E = E/(M*N);
    
end