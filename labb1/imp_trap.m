function [svar]=imp_trap(quatercar,quaterg,tspan,A_styv,v0,h)
%Löser dv = v(t,y) med initialvärde v(t0) = v0

n = (tspan(2)-tspan(1))/h;

tv=tspan(1)+ h*(0:n);
N = size(tv);
yv=zeros(4, N(2));
yv(:,1)=v0;
I = eye(4);
invers = inv(2*I - h*A_styv);

for ii=1:(n)
    yv(:,ii+1) = (invers)*(2*yv(:,ii) + h*(quatercar(tv(ii),yv(:,ii)) + quaterg(tv(ii+1))));
end
svar = [tv; yv];

return