a =[3 3 3;3 3 3; 3 3 3]
fluct_a = calculateFluctuation(a);

b =[3 0 3;0 3 0; 3 0 3]
fluct_b = calculateFluctuation(b);

Img = imread('lena512.bmp');
if size(Img,3)==3
    Img = rgb2gray(Img)
end
M = uint8(Img);
block = getBlock(M, 32, 10);
imshow(M)
figure
imshow(block)
fluct_block = calculateFluctuation(block);
