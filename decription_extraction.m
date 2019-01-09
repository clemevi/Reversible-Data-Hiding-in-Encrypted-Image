Img2 = read_img('TEST/lena_hide.bmp');
M_dec = ImageDecryption(Img2, encryption_password);

figure
title('m_dec')
imshow(M_dec);

[M_src, bit_secret] = DataExtraction(M_dec,hiding_password, 32);
secret= char_format_data(bit_secret);
