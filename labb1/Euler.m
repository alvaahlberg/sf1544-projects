function [tv,yv]=Euler(dv,tspan,v0,n)
%Löser dv = v(t,y) med initialvärde v(t0) = v0

t0=tspan(1);
tfin=tspan(2);
h=(tfin-t0)/n;

tv=a+h*(0:n);
yv=zeros(size(tv));
yv(1)=v0;

for ii=1:n
    yv(ii+1)=yv(ii)+h*dv(tv(ii),yv(ii));
end