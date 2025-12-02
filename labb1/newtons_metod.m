function [svarsvek] = newtons_metod(kv0, n)
%   Newtons Metod för att lösa ut olika k värden

kv = zeros(2,n);
kv(:,1) = kv0;

for ii=1:n
    s = -Jacobian_transfer_functions(kv(1,ii),kv(2,ii))\(transfer_functions(kv(1,ii),kv(2,ii),0.71,1));
    kv(:,ii+1) = kv(:,ii) + s;

end

svarsvek = kv;