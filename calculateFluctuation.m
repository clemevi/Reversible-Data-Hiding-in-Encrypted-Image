function f = calculateFluctuation(I)
%I image bidimensional matrix in gray scale
%f is the fluctuation calculated as the difference by value of pixel and 
%the mean value of his 4 neighbours 

f=0;
%image has to be greater than 2x2
if size(I, 1)>2 && size(I, 2)> 2
    I = im2double(I);
% for each pixel, except boundary pixel, compute fluctuation 
    for i=2:size(I, 1)-1
        for j=2:size(I, 2)-1
            neighbours_mean= (I(i, j+1)+ I(i, j-1)+I(i+1, j)+I(i-1, j))/4;
            f = f+abs(I(i,j)- neighbours_mean);
        end
    end
end

end

