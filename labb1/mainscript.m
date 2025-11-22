
t = input("Hur långt tid går vi över?: ");
tspan = [0,t];
n = input("Hur många steg vill du ta?: ");
v0 = [0;0;0;0];

Result = Euler(@quatercar,tspan, v0,n);

Tid = Result(1,:);
Z1 = Result(2,:);
Z2 = Result(3,:);

plot(Tid,Z1)
