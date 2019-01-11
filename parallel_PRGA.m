function pad = parallel_PRGA(K,n, p)
%   Parallelized Stream Cipher
%
%   N.B. 
%   - mod(n,p) = 0  (p must divide p)
%   - 'parallel computing toolbox' must be installed


%generate p key of lenght N (one for core)

    l = size(K,2);
    keys = PRGA(K, l*p);
    keys = reshape(keys,p,l);


pads = zeros(p,n/p);

%parallel loop
parfor i = 1:p
    
    pads(i,:) = PRGA( keys(i,:), n/p);
    
end

%get output as a row vector
pad = reshape(pads,[],1)';

end

