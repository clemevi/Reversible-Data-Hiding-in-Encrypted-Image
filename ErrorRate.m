%%calcolare Error rate

function [outputArg1,outputArg2] = ErrorRate(inputArg1,inputArg2)
%ERRORRATE 
%INPUT: l'originale e la decifrata (stesse dimensioni)
%OUTPUT: valore dell'energia media dell'errore.
%l'errore medio è calcolato solo sugli utlimi 3 bit di ogni pixel, in decimale (o anche sul valore intero del pixel)
%è la sommatoria della differenza al quadrato degli ultimi 3 bit di ogni pixel, diviso il numero di pixel
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

