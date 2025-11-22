clear

%z1 och z2. 2a)
t = input("Hur långt tid går vi över?: ");
tspan = [0.000000001,t];
v0 = [0;0;0;0];

options = odeset('RelTol',1e-6, 'AbsTol', 1e-7, 'Refine', 1);
[tv,yv] = ode45(@quatercar,tspan,v0,options);

z1 = yv(:,1);
z2 = yv(:,2);

plot(tv,z1,tv,z2);

%Tidslängd. 2b)
%lengthtv = size(tv);

%dtv = zeros(lengthtv(1),1);

%dvt(1) = tv(1);

%for ii=2:lengthtv(1)
 %   dtv(ii) = tv(ii) - tv(ii-1);
%end

%plot(tv, dtv);

%Eulers metod, jämförelse. 2c)
n = input("Hur många steg vill du ta?: ");
result1 = Euler(@quatercar,tspan, v0,n);
Tid = result1(1,:);
Z1 = result1(2,:);
Z2 = result1(3,:);
plot(Tid,Z2,tv,z2)
