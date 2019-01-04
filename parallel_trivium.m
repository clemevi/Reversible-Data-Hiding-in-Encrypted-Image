function pad = parallel_trivium(n,K, p)

%   N.B. 
% - n deve essere divisibile per p
% - cè bisogno di installare il 'parallel computing toolbox' da Addon

tic;

keys = zeros(p,80);

%default value
keys(1,:) = [1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

%generate p key (one for core)
for j=2:p;

    keys(j,:) = trivium (80,keys(j-1,:));

end

pads = zeros(p,n/p);

%parallel loop
parfor i = 1:p;
    
    pads(i,:) = trivium(n/p, keys(i,:));
    
end

time = toc

%get output as a row vector
pad = reshape(pads,[],1)';

end

