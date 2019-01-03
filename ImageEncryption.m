function IE_matrix = ImageEncryption(Key, I_Matrix)

    %I_Matrix = imread('test_images\dritta.jpeg');
    %I_Matrix = rgb2gray(I_Matrix);
    %imshow(I_Matrix);
    [M,N] = size(I_Matrix);
    
    I_Vector = I_Matrix(:); %vettorializzo matrice ---vettore colonna
    I_Vector = I_Vector';   %trasformo vettore riga
    
    B_Vector = de2bi(I_Vector); %matrice ogni riga è un elemento del vettore I_Vector in binario
    B_Vector = B_Vector(:);
    B_Vector = B_Vector';
    
    l= M*N*8; %lunghezza stringa per criptare

    %Key = [1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    Pad = trivium(l, Key); %costruisco pad per criptare

    %E_Vector = zeros(1, l); %vettore criptato
    for j=1:l
        E_Vector(j) = bitxor(B_Vector(j),Pad(j));
    end

    E_Vector = reshape(E_Vector',[M*N,8]); %matrice ad 8 colonne
    IE_Vector = bi2de(E_Vector);           %trasformo ogni riga in un intero
    IE_Vector = IE_Vector';
    IE_matrix = reshape(IE_Vector,[M,N]);  %matrice criptata
    imshow(IE_matrix);
    
    
% I_Vector = IE_Vector(:); %vettorializzo matrice ---vettore colonna
% I_Vector = I_Vector';   %trasformo vettore rigavettore
% Binary_vector = de2bi(I_Vector); %matrice ogni riga è un elemento del vettore I_Vector in binario
% Binary_vector = Binary_vector(:);
% Binary_vector = Binary_vector';
% 
% for j=1:l
%     
%     Binary_vector(j) = bitxor(Binary_vector(j),Pad(j));
%     
% end
% 
% Binary_vector = reshape(Binary_vector',[782208,8]);
% IE_Vector = bi2de(Binary_vector);
% IE_Vector = IE_Vector';
% IE_Vector = reshape(IE_Vector,[M,N]);
% figure
% imshow(IE_Vector);

end
