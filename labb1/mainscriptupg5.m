clear

%5a
kv0 = input("Skriv initialgissning av k-värdena: ");
tol = input("Skriv toleransen för newtonmetoden: ");
svarvek = newtons_metod(kv0,tol);

k_1_opt = svarvek(1,1)
k_2_opt = svarvek(2,1)

%5b

storlek_e = size(svarvek);
l_e = storlek_e(2)-1;

e_n2 = svarvek(:,l_e);
e_n1 = svarvek(:,(l_e - 2));

M_1 = e_n2(1) / (e_n1(1))^2
M_2 = e_n2(2) / (e_n1(2))^2


%5c
t = input("Hur lång tid vill du gå över:");
h = input("Vilket tidsteg vill du ta:");

tspan = [0.000000001,t];
konst = values;
A_ref = matrixA(konst);
v0 = [0;0;0;0];

ref_euler = Euler(@(t,y) quatercar(A_ref,konst,t,y),tspan, v0,h);

konst(3) = svarvek(1,1);
konst(4) = svarvek(2,1);
A_ny = matrixA(konst);

ny_euler = Euler(@(t,y) quatercar(A_ny,konst,t,y),tspan, v0,h);

plot(ref_euler(1,:),ref_euler(2,:),ny_euler(1,:),ny_euler(2,:))
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('z1 ref-k', 'z1 opt-k')