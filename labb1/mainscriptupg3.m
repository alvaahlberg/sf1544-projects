clear

%3b)
konst = values;
A = matrixA(konst);
lambda = eig(A);
F = zeros(4,1);

for k=1:4
    F(k) = (-2*real(lambda(k)))/(abs(lambda(k))^2);
end

max_dt = min(F)

if 5*10^(-3) < max_dt
    disp("5*10^(-3) är stiabilt")
else
    disp("5*10^(-3) är inte stiabil")
end

%3c)

max_dt_alpha = max_dt*[0.9; 1.0; 1.1; 1.5];
v0 = [0;0;0;0];
t = input("Hur långt tid ska du gå över?: ");
tspan = [0.000000001,t];

subplot(3,1,1)
for ii=1:4
    result = Euler(@(t,y) quatercar(A,konst,t,y),tspan, v0, max_dt_alpha(ii));
    plot(result(1,:),result(2,:))
    hold on
end
title('Z1')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('0.9', '1','1.1','1.5')

hold off

subplot(3,1,2)
for ii=1:4
    result = Euler(@(t,y) quatercar(A,konst,t,y),tspan, v0, max_dt_alpha(ii));
    plot(result(1,:),result(3,:))
    hold on
end
title('Z2')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('0.9', '1','1.1','1.5')

hold off

%3d
konst(4) = 100*konst(4);
A_styv = matrixA(konst);
lambda_styv = eig(A_styv);
F_styv = zeros(4,1);

for k=1:4
    F_styv(k) = (-2*real(lambda_styv(k)))/(abs(lambda_styv(k))^2);
end

max_dt_styv = min(F_styv)

result_2 = Euler(@(t,y) quatercar(A_styv,konst,t,y),tspan, v0, (max_dt_styv*0.1));

subplot(3,1,3)
plot(result_2(1,:),result_2(2,:),result_2(1,:),result_2(3,:))
title('Styvt system')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('z1', 'z2')