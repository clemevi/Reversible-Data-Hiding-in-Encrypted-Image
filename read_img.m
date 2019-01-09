function Img_8bit = read_img(img_path)
%read image from path, convert in gray scale if necessary and set
%profondity to 8 bit.

Img = imread(img_path);
if size(Img,3)==3
    Img = rgb2gray(Img);
end

Img_8bit = uint8(Img);
end

