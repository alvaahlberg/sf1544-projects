function[dv]=quatercar(t,v)
%Funktionen tar in ett värde på tid och första värdet på vektorn dv/dt =
%y0. Den skriver om 

m1 = 475;   %input('Skriv in första massan (kg): ');
m2 = 53;   %input('Skriv in andra massan (kg): ');
k1 = 5400;   %input('Skriv in första fjäderkonstanten (kg/s^2): ');
k2 = 135000;    %input('Skriv in andra fjäderkonstanten (kg/s^2): ');
c1 = 310;   %input('Skriv in första dämpningskonstanten (kg/s): ');
c2 = 1200;   %input('Skriv in andra dämpningskonstanten (kg/s): ');
vbil = (65/3.6);    %input('Skriv in hastigheten på bilen (m/s): ');
H = 0.24; %input('Skriv in höjden på guppet (m): ');
L = 1;    %input('Skriv in längden på guppet (m): ');


if t < (L/(vbil))
    h = (H/2)*(1-cos(2*pi*vbil*t/L));
    dh = (H*pi*vbil/L)*(sin(2*pi*vbil*t/L));
else
    h = 0;
    dh = 0;
end

A = [0 0 1 0
    0 0 0 1 
    -(k1/m1) (k1/m1) -(c1/m1) (c1/m1)
    (k1/m2) -((k1+k2)/m2) (c1/m2) -((c1+c2)/m2)];

g = [0;0;0;(((k2*h)/m2)+((c2*dh)/m2))];

dv = (A*v + g);
