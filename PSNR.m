function peaksnr = PSNR(Img,ref)
%PSNR Summary of this function goes here
%   Detailed explanation goes here
% PSNR = 10*LOG10((255^2)/(Err_ass/2))=37.9dB

E = Error_Rate(Img,ref);
peaksnr = 10 * log10((255*255)/(E));
%psnr(Img,ref);

end

