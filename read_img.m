function Img_8bit = read_img(img_path)
%Input: Image path
%Output: Two-dimensional matrix with values between 0 and 255
%Read image from path, convert in gray scale if necessary and set
%profondity to 8 bit.

Img = imread(img_path);
if size(Img,3)==3
    Img = rgb2gray(Img);
end

Img_8bit = uint8(Img);
end

