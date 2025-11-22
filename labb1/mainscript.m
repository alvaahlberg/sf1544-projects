clear

t = input("Hur långt tid går vi över?: ");
tspan = [0.000000001,t];
n = input("Hur många steg vill du ta?: ");
v0 = [0;0;0;0];

%result1 = Euler(@quatercar,tspan, v0,n);
options = odeset('RelTol',1e-6, 'AbsTol', 1e-7, 'Refine', 4);
[tv,yv] = ode45(@quatercar,tspan,v0,options);

kolumn1 = yv(:,1);

plot(tv,kolumn1)

%Tid = result1(1,:);
%Z1 = result1(2,:);
%Z2 = result1(3,:);
%plot(Tid,Z1)

