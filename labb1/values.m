function [konst] = values

m1 = 475;   %input('Skriv in första massan (kg): ');
m2 = 53;   %input('Skriv in andra massan (kg): ');
k1 = 5400;   %input('Skriv in första fjäderkonstanten (kg/s^2): ');
k2 = 135000;    %input('Skriv in andra fjäderkonstanten (kg/s^2): ');
c1 = 310;   %input('Skriv in första dämpningskonstanten (kg/s): ');
c2 = 1200;   %input('Skriv in andra dämpningskonstanten (kg/s): ');
vbil = (65/3.6);    %input('Skriv in hastigheten på bilen (m/s): ');
H = 0.24; %input('Skriv in höjden på guppet (m): ');
L = 1;    %input('Skriv in längden på guppet (m): ');

konst = [m1; m2; k1; k2; c1; c2; vbil; H; L];

end