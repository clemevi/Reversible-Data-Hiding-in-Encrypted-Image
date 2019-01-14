clear all; close all;

encryption_password = 'clemente';
hiding_password = 'hiding';

%##########################     TEST     ##################################
% TEST LENA512
% test_image = 'TEST/lena512.bmp';
% test_image_HIDE = 'TEST/lena512_hide.bmp';
% data_to_hide = format_data_to_hide('Nella vecchia fattoria ia ia ohh');

% TEST BABOON900
test_image = 'TEST/baboon900.bmp';
test_image_HIDE = 'TEST/baboon900_hide.bmp';
% data_to_hide = format_data_to_hide('Lorem ipsum dolor sit amet, consectetur cras amet.');

% TEST Mars
% test_image = 'TEST/Mars.bmp';
% test_image_HIDE = 'TEST/baboon900_hide.bmp';
%data_to_hide = format_data_to_hide('Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura, ché la diritta via era smarrita. Ahi quanto a dir qual era è cosa dura esta selva selvaggi');
%data_to_hide = format_data_to_hide('Nella vecchia fattoria ia ia ohh abcdert');

data_to_hide = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in sollicitudin nibh. Phasellus et nulla nec quam sagittis pellentesque. Aliquam sed ex molestie metus viverra interdum vel nec enim. Proin ac viverra lacus. Nulla consectetur interdum auctor. Nam ut mi in nulla iaculis ultrices vel vitae augue. Nunc bibendum nibh non accumsan consectetur. Fusce in congue lacus, vel condimentum justo. Fusce consequat facilisis magna sit amet vestibulum. Integer malesuada arcu sit amet suscipit egestas. Aliquam bibendum sed nisl nec porta. Morbi facilisis dolor pulvinar, maximus elit sit amet, blandit turpis. Aenean dictum eros purus, ut molestie eros consectetur vel. Fusce vel lacinia urna. Quisque quis lobortis tortor, sit amet lobortis lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ultricies sagittis ex, sed cursus nunc auctor eu. Sed a lectus venenatis, tristique risus vitae, congue felis. Curabitur scelerisque, erat ac placerat tristique, arcu posuere.';

%##########################################################################




tic
encryption_embedding;
time_to_enc_emb = toc

clear M; clear M_enc; clear M_hide;

tic
decription_extraction;
time_to_dec_extr = toc