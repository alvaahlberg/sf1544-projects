function k_opt_konv = newtons_metod(kv0, tol)
%   Newtons Metod för att lösa ut olika k värden

kv = kv0;

for ii=1:100
    s = -Jacobian_transfer_functions(kv(1,ii),kv(2,ii))\(transfer_functions(kv(1,ii),kv(2,ii),0.71,1));
    kv = [kv, (kv(:,ii) + s)];
    if abs(s) < tol
        break
    end
end

storlek = size(kv)

ev = abs(kv(1)-kv(:,storlek(2)));

for ii=2:(storlek(2)-1)
    ev= [ev, abs(kv(:,ii)-kv(:,storlek(2)))];
end

konvergens = ev;
svarsvek = kv(:,storlek(2));
k_opt_konv = [svarsvek, konvergens];