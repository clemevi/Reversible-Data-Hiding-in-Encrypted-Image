Img2 = read_img(test_image_HIDE);
M_dec = ImageEncDec(Img2, encryption_password);

figure
title('m_dec')
imshow(M_dec);

[M_src, bit_secret] = dataExtraction(M_dec,hiding_password, size_data);
secret= char_format_data(uint8(bit_secret));
