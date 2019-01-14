%Input: Two-dimensional matrix, Two-dimensional matrix
%Output: Integer
%Given the original and the deciphered image, calculate the average energy value of the error.
%the sum of the square differences of the last 3 bits of each pixel of the original image and
%of the deciphered image, divided by the number of pixels

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