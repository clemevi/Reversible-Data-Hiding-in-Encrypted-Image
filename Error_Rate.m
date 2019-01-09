%INPUT: l'originale e la decifrata (stesse dimensioni)
%OUTPUT: valore dell'energia media dell'errore.
%Error_rate: l'errore medio Ã¨ calcolato solo sugli utlimi 3 bit di ogni pixel, in decimale (o anche sul valore intero del pixel)
%Ã¨ la sommatoria della differenza al quadrato degli ultimi 3 bit di ogni pixel, diviso il numero di pixel

function E = Error_Rate(Mat1, Mat2)  
    
    [M,N] = size(Mat1);
    Mat1 = int16(Mat1);
    Mat2 = int16(Mat2);
    E = 0.0;
    for i=1:M
        for j=1:N
            x = bitand(Mat1(i,j),7);
            y = bitand(Mat2(i,j),7);
            if(x ~= y)
               E = E + ( double(x-y) )^2;
            end
        end
    end
        
    E = E/(M*N);
   
end