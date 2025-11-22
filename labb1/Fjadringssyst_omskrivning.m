%Uppgift 1, skriv om rörelseekvationerna som ett första ordningens system i
%tiden på formen dv/dt = Hv + g(t).

m1 = input('Skriv in första massan (kg): ');
m2 = input('Skriv in andra massan (kg): ');
k1 = input('Skriv in första fjäderkonstanten (kg/s^2): ');
k2 = input('Skriv in andra fjäderkonstanten (kg/s^2): ');
c1 = input('Skriv in första dämpningskonstanten (kg/s): ');
c2 = input('Skriv in andra dämpningskonstanten (kg/s): ');
v = input('Skriv in hastigheten på bilen (m/s): ');
H = input('Skriv in höjden på guppet (m): ');
L = input('Skriv in längden på guppet (m): ');


t = 1;

if t > (L/(v*t))
    h = 0;
else
    h = (H/2)*(1-cos(2*pi*v*t/L))
end

M = [m1 0; 0 m2]
C = [c1 -c1; -c1 (c1+c2)]
K = [k1 -k1; -k1 (k1+k2)]
F = [0; ((k2*h)+(c2*h))]

syms z1 z2
dz1 = diff(z1)
dz2 = diff(z2)

x = tanspose([z1 z2 dz1 dz2])

