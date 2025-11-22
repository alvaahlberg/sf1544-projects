function [ans]=Euler(quatercar,tspan,v0,n)
%Löser dv = v(t,y) med initialvärde v(t0) = v0

t0=tspan(1);
tfin=tspan(2);
h=(tfin-t0)/n;

tv=t0+h*(0:n);
N = size(tv);
yv=zeros(4, N(2));
yv(:,1)=v0;

for ii=1:n
    yv(:,ii+1)=yv(ii)+h*quatercar(tv(ii),yv(:,ii));
end

ans = [tv; yv];

return