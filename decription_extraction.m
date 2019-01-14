tic
Img2 = read_img('TEST/lena_hide.bmp');
M_dec = ImageEncDec(Img2, encryption_password);

figure
title('m_dec')
imshow(M_dec);
%time_to_decryption = toc

%tic
[M_src, bit_secret] = DataExtraction(M_dec,hiding_password, 32);
secret= char_format_data(bit_secret);
time_to_extraction = toc
%Total_time = time_to_decryption + time_to_extraction