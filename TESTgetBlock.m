Img = imread('lena512.bmp');
if size(Img,3)==3
    Img = rgb2gray(Img)
end
M = uint8(Img);
imshow(M)
B = getBlock(M, 11, 11);
figure
imshow(B)