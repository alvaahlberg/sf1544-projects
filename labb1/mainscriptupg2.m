clear

konst = values;
A = matrixA(konst);

%z1 och z2. 2a)
t = input("Hur långt tid går vi över?: ");
h = input("Hur stor steglängd vill du ta? (för Euler): ");
tspan = [0.000000001,t];
v0 = [0;0;0;0];

options = odeset('RelTol',1e-6, 'AbsTol', 1e-7, 'Refine', 1);
[tv,yv] = ode45(@(t,y) quatercar(A,konst,t,y),tspan,v0,options);

z1 = yv(:,1);
z2 = yv(:,2);

subplot(3,1,1)
plot(tv,z1,tv,z2)
title('ODE45')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('z1','z2')

Maxium_z1 = max (z1)
Maxium_z2 = max (z2)

%Tidslängd. 2b)
lengthtv = size(tv);

dtv = zeros(lengthtv(1),1);

dvt(1) = tv(1);

for ii=2:lengthtv(1)
    dtv(ii) = tv(ii) - tv(ii-1);
end

subplot(3,1,2)
plot(tv, dtv)
title('ODE45 tidssteg')
xlabel('Tid (s)')
ylabel('Steglängd')


%Eulers metod, jämförelse. 2c)
result1 = Euler(@(t,y) quatercar(A,konst,t,y),tspan, v0,h);
Tid = result1(1,:);
Z1 = result1(2,:);
Z2 = result1(3,:);

subplot(3,1,3)
plot(Tid,Z2,tv,z2)
title('Euler vs ODE45')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('z2 Euler', 'z2 ODE45')
