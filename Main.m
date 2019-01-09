Img = imread('TEST/lena512.bmp');
if size(Img,3)==3
    Img = rgb2gray(Img);
end

M = uint8(Img);
[m,n] = size(M);

M_enc = ImageDecryption(M,"clemente");

data = uint8('Nella vecchia fattoria ia ia ohh');
data = de2bi(data,8);

%space = mod(m*n,size(data,2));

    
data = reshape(data,[1, size(data,1)*8]);


kh = "hiding";

M_hide = DataEmbedding(data, M_enc, kh);

figure;

imshow(M_hide);title('m_hide');


imwrite(M_hide,"lena_hide.bmp");

%%%FINE CIFRATURA E HIDING
Img2 = imread('lena_hide.bmp');
if size(Img2,3)==3
    Img2 = rgb2gray(Img2);
end

M_dec = ImageDecryption(Img2, "clemente");

figure;

imshow(M_dec);title('m_dec');

[M_src, secret] = DataExtraction(M_dec,kh, 32);
secret1 = reshape(secret,[32 8]);
secret2 = bi2de(secret1);
secret3 = char(secret2)';

