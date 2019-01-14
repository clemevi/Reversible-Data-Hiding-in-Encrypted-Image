M = read_img(test_image);

range = getRange(M);
if(isempty(range))
    fprintf("ERROR: IMAGE BAD FORMAT. GET RANGE RETURN EMPTY VECTOR");
    return;
end
data_to_hide = format_data_to_hide(data_to_hide(1:(range(1)/8)));
size_data = size(data_to_hide, 2);

M_enc = ImageEncDec(M,encryption_password);

M_hide = DataEmbedding(data_to_hide, M_enc, hiding_password);

figure
title('m_hide');
imshow(M_hide);
imwrite(M_hide,test_image_HIDE);




