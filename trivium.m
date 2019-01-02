function bit=trivium(n,Key)

% Expresar los arrays sin comas! (es lo mismo...)
Key= [1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
IV=[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Comp_A = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
Comp_B = [0, 0, 0, 0];
%n = 12;
output_array = [];
%n = str2num(n);
%Convierto la clave pasaada como argumento desde java en binario (primero
%cada char en su representación decimal en ASCII y luego en binario)
%long=length(Key_string)


%for i= 1:long
 %   binary=dec2bin('i',8);
  %  Keys= [Keys binary];
%end

%Key=Keys
% Armo los shifter concatenandoles los complementos

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.2 Key and IV setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shifter_A=cat(2,Key, Comp_A);
shifter_B=cat(2,IV, Comp_B);
shifter_C=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1];

shifter_A_aux=shifter_A;
shifter_B_aux=shifter_B;
shifter_C_aux=shifter_C;

%bitxor(Key,IV)
%length(shifter_A)
%length(shifter_B)
%length(shifter_C)


%NOTA: El primer elemento en un array en matlab es el 1 (a diferencia de bash que es el 0)
%
tic;
for i = 1:(4*288)
s=cat(2,shifter_A_aux, shifter_B_aux, shifter_C_aux);
t1 = bitxor((bitxor((bitxor(s(66),(bitand(s(91),s(92))))),s(93))),s(171));
t2 = bitxor((bitxor((bitxor((bitand(s(175),s(176))),s(162))),s(177))),s(264));
t3 = bitxor((bitxor((bitxor((bitand(s(286),s(287))),s(243))),s(288))),s(69));	

shifter_A_aux = [ t3 shifter_A_aux(1:end-1) ];
shifter_B_aux = [ t1 shifter_B_aux(1:end-1) ];
shifter_C_aux = [ t2 shifter_C_aux(1:end-1) ];
end
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.1 Key stream generation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%shifter_A = [0 0 1 1 0 1 1 1 0 0 0 0 1 0 1 0 1 1 1 0 0 1 1 1 1 0 1 0 1 0 1 1 1 1 1 1 1 1 0 1 1 1 0 0 0 0 1 1 1 1 1 1 0 1 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1]
%shifter_B = [0 1 1 1 0 0 1 1 0 1 0 0 0 0 1 1 1 1 0 1 1 1 1 0 1 1 0 1 0 0 1 0 1 0 1 1 0 1 1 1 0 0 1 1 0 1 1 0 1 1 0 0 1 0 1 1 1 0 1 1 1 0 0 1 0 1 1 0 1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 1]
%shifter_C = [1 1 0 1 0 1 1 0 0 1 1 1 1 0 0 1 1 0 1 1 0 0 1 0 0 1 1 0 1 1 1 0 1 1 1 0 0 1 0 1 1 1 0 1 0 0 0 1 0 1 0 1 0 0 0 0 1 0 0 0 1 1 1 0 1 1 1 1 1 1 0 0 0 1 0 0 1 1 0 0 1 1 0 1 0 1 0 1 0 1 1 0 0 1 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1]

%output_array = zeros(1, n);
for i = 1:(n)
s=cat(2,shifter_A_aux, shifter_B_aux, shifter_C_aux);
t1 = bitxor(s(66),s(93));
t2 = bitxor(s(162),s(177));
t3 = bitxor(s(243),s(288));
zi = bitxor((bitxor(t1,t2)),t3);
output_array(end+1) = zi;
t1 = bitxor((bitxor((bitand(s(91),s(92))),s(171))),t1);
t2 = bitxor((bitxor((bitand(s(175),s(176))),s(264))),t2);
t3 = bitxor((bitxor((bitand(s(286),s(287))),s(69))),t3);

shifter_A_aux = [ t3 shifter_A_aux(1:end-1) ];
shifter_B_aux = [ t1 shifter_B_aux(1:end-1) ];
shifter_C_aux = [ t2 shifter_C_aux(1:end-1) ];
end

%disp(output_array)
%fprintf('%g\t\n',output_array)
fprintf('%d',output_array)
time = toc;
disp(time)
%h=histogram(output_array)
bit = output_array;

end
