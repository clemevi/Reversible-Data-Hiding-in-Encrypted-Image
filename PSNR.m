function peaksnr = PSNR(Img,ref)
%PSNR Summary of this function goes here
%   Detailed explanation goes here
% PSNR = 10*LOG10((255^2)/(Err_ass/2))=37.9dB


peaksnr = psnr(Img,ref);

end

