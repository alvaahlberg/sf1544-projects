function[dv]=quatercar(A,values,t,v)
%Funktionen tar in ett värde på tid och första värdet på vektorn dv/dt =
%y0. Den skriver om 

m2 = values(2);
k2 = values(4);
c2 = values(6);
vbil = values(7);
H = values (8);
L = values(9);

if t < (L/(vbil))
    h = (H/2)*(1-cos(2*pi*vbil*t/L));
    dh = (H*pi*vbil/L)*(sin(2*pi*vbil*t/L));
else
    h = 0;
    dh = 0;
end

g = [0;0;0;(((k2*h)/m2)+((c2*dh)/m2))];

dv = (A*v + g);

end
