%INPUT: l'originale e la decifrata (stesse dimensioni)
%OUTPUT: valore dell'energia media dell'errore.
%Error_rate: l'errore medio è calcolato solo sugli utlimi 3 bit di ogni pixel, in decimale (o anche sul valore intero del pixel)
%è la sommatoria della differenza al quadrato degli ultimi 3 bit di ogni pixel, diviso il numero di pixel
%Error_vector: vettore contenente le coordinate dei pixel non corretti
%Error_mat: immagine a sfondo nero con evidenziati i pixel non corretti
%Error_img: immagine originale con evidenziati i pixel non corretti

function [Error_rate, Error_vector, Error_mat, Error_img] = ErrorRate(Mat1, Mat2)
    %Mat1 = imread('test_images\dritta.jpeg');
    %Mat1 = rgb2gray(Mat1);
    %Mat2 = Mat1;
    %Mat2(5:20, 5:20)=255;
    
    
    [M,N] = size(Mat1);
    Error_mat= zeros(M, N);
    Error_img = Mat1;
    Error_vector=[0,0];
    x=0;
    for i=1:M
        for j=1:N
            if Mat1(i, j) ~= Mat2(i, j)
                Error_mat(i, j)= 255;
                if Mat1(i, j) > 128
                    Error_img(i, j)= 0;
                else
                    Error_img(i, j)= 255;
                end
                x=x+1;
                Error_vector(x,1)=i;
                Error_vector(x,2)=j;
            end
        end
    end
        
    %imshow(Mat1);
    %figure;
    %imshow(Mat2);
    %figure;
    imshow(Error_mat);
    figure;
    imshow(Error_img);
    %Error_vector
    
    Error_rate= x/(M*N)
    
end