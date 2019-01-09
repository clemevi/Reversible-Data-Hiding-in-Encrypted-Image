M = read_img('TEST/lena512.bmp');
encryption_password = 'clemente';
hiding_password = 'hiding';
data_to_hide = format_data_to_hide('Nella vecchia fattoria ia ia ohh');

M_enc = ImageDecryption(M,encryption_password);

M_hide = DataEmbedding(data_to_hide, M_enc, hiding_password);

figure
title('m_hide')
imshow(M_hide)
imwrite(M_hide,'TEST/lena_hide.bmp');




