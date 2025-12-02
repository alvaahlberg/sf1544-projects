clear

% Löser uppgift 5
kv0 = [6000;100000];
svarvek = newtons_metod(kv0,100);

t = input("Hur lång tid vill du gå över:");
h = input("Vilket tidsteg vill du ta:");

tspan = [0.000000001,t];
konst = values;
A_ref = matrixA(konst);
v0 = [0;0;0;0];


ref_euler = Euler(@(t,y) quatercar(A_ref,konst,t,y),tspan, v0,h);
% subplot(2,1,1)
% title("reference Euler")
% xlabel('Tid (s)')
% ylabel('Förskjutning (m)')
% plot(ref_euler(1,:),ref_euler(2,:))


konst(3) = svarvek(1,100);
konst(4) = svarvek(2,100);
A_ny = matrixA(konst);

ny_euler = Euler(@(t,y) quatercar(A_ny,konst,t,y),tspan, v0,h);
% subplot(2,1,2)
% title("Optrimerade k värden")
% xlabel('Tid (s)')
% ylabel('Förskjutning (m)')
% plot(ny_euler(1,:),ref_euler(2,:))


plot(ref_euler(1,:),ref_euler(2,:),ny_euler(1,:),ny_euler(2,:))
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('z1 ref-k', 'z1 opt-k')