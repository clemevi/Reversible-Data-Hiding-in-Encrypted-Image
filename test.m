clear all; close all;

encryption_password = 'Esame compressione dei dati';
hiding_password = 'Ximpeng Zhang';

%per cambiare immagine decommentare 
%##########################     TEST     ##################################
% TEST LENA512 (hide 32 char -> 256 bit)
 test_image = 'TEST/lena512.bmp';
 test_image_HIDE = 'TEST/lena512_hide.bmp';


% TEST BABOON900 (hide 50 char -> 400 bit)
%  test_image = 'TEST/baboon900.bmp';
%  test_image_HIDE = 'TEST/baboon900_hide.bmp';


% TEST BABOON 400X500 (errore nell'estrazione del 71-esimo bit)
%  test_image = 'TEST/baboon_color.bmp';
%  test_image_HIDE = 'TEST/baboon_color_hide.bmp';


% TEST BARBARA 576x720 (hide 40 char -> 320 bit)
%  test_image = 'TEST/barbara.bmp';
%  test_image_HIDE = 'TEST/barbara_hide.bmp';


% TEST bone_scint 1800x1100 (hide 99 char -> 792 bit)
% test_image = 'TEST/bone_scint.pgm';
% test_image_HIDE = 'TEST/bone_scint_hide.pgm';


data_to_hide = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in sollicitudin nibh. Phasellus et nulla nec quam sagittis pellentesque. Aliquam sed ex molestie metus viverra interdum vel nec enim. Proin ac viverra lacus. Nulla consectetur interdum auctor. Nam ut mi in nulla iaculis ultrices vel vitae augue. Nunc bibendum nibh non accumsan consectetur. Fusce in congue lacus, vel condimentum justo. Fusce consequat facilisis magna sit amet vestibulum. Integer malesuada arcu sit amet suscipit egestas. Aliquam bibendum sed nisl nec porta. Morbi facilisis dolor pulvinar, maximus elit sit amet, blandit turpis. Aenean dictum eros purus, ut molestie eros consectetur vel. Fusce vel lacinia urna. Quisque quis lobortis tortor, sit amet lobortis lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ultricies sagittis ex, sed cursus nunc auctor eu. Sed a lectus venenatis, tristique risus vitae, congue felis. Curabitur scelerisque, erat ac placerat tristique, arcu posuere.';

%##########################################################################



%vedere script encryption_embedding
tic
encryption_embedding;
time_to_enc_emb = toc

clear M; clear M_enc; clear M_hide;

%vedere script decription_extraction
tic
decription_extraction;
time_to_dec_extr = toc

difference =  find(bit_secret~=data_to_hide);
if(isempty(difference))
    fprintf("Ricostruzione ed estrazione eseguita con successo.\n");
else
    
    fprintf("Errore nell'estrazione di %d su %d bit, dai blocchi: \n", size(difference,2), size(bit_secret,2));
    fprintf('%d - ',difference);
    
end