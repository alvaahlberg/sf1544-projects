clear
%4a
konst = values;
konst(4) = 100*konst(4);
A_styv = matrixA(konst);

v0 = [0;0;0;0];
t = input("Hur långt tid ska du gå över?: ");
tspan = [0.000000001,t];

h = 0.00011181 * [1; 10; 100];


figure1 = figure;
subplot (2,1,1)
for ii=1:3
    result = imp_trap(@(t,y) quatercar(A_styv,konst,t,y), @(t) quaterg(konst,t), tspan, A_styv, v0, h(ii));
    plot(result(1,:),result(2,:))
    hold on
end
hold off

subplot (2,1,2)
for ii=1:3
    result = imp_trap(@(t,y) quatercar(A_styv,konst,t,y), @(t) quaterg(konst,t), tspan, A_styv, v0, h(ii));
    plot(result(1,:),result(3,:))
    hold on
end
hold off
title("Implicita trapetsmetoden")
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('1', '10','100')


%4b
h2 = input("Hur lång steglängd vill du ha: ");
stegvek = [1; 1/2; 1/4; 1/8]*h2;
tspanfix = [0.000000001,0.05];

options = odeset('RelTol',1e-9, 'AbsTol', 1e-9, 'Refine', 1);
sol = ode45(@(t,y) quatercar(A_styv,konst,t,y),tspanfix,v0,options);
% yv kommer vara mycket längre än result

figure2 = figure;
titlevek = ["Steglängd h"; "Steglängd h/2";"Steglängd h/4";"Steglängd h/8"];

maxfel = [0,0,0,0];

for ii=1:4
    result2 = imp_trap(@(t,y) quatercar(A_styv,konst,t,y), @(t) quaterg(konst,t), tspanfix, A_styv, v0, stegvek(ii,:));
    y_ny = deval(sol,result2(1,:));
    diff = abs(result2(3,:)-y_ny(2,:));

    maxfel(ii) = max(diff);

    %Lopping funkar inte riktigt lol
    
    subplot (4,1,ii)
    plot(result2(1,:),diff)
    title(titlevek(ii))
    xlabel('Tid (s)')
    ylabel('Abs fel')
    hold on
end
 hold off

fel_h1 = maxfel(1)
fel_h2 = maxfel(2)
fel_h3 = maxfel(3)
fel_h4 = maxfel(4)

fel_h1_fjardedel = fel_h1/4





