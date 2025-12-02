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


% [tv,yv] = ode45(@(t,y) quatercar(A_styv,konst,t,y),tspan,v0,options);
% subplot(3,1,3)
% plot(tv,yv(:,1),tv,yv(:,2))


h2 = input("Hur lång steglängd vill du ha: ");
stegvek = [1; 1/2; 1/4; 1/8]*h2;
tspanfix = [0.000000001,0.05];

options = odeset('RelTol',1e-9, 'AbsTol', 1e-9, 'Refine', 1);
sol = ode45(@(t,y) quatercar(A_styv,konst,t,y),tspanfix,v0,options);
% yv kommer vara mycket längre än result
figure2 = figure;
titlevek = ["Steglängd h"; "Steglängd h/2";"Steglängd h/4";"Steglängd h/8"];
for ii=1:4
    result2 = imp_trap(@(t,y) quatercar(A_styv,konst,t,y), @(t) quaterg(konst,t), tspanfix, A_styv, v0, stegvek(ii,:));
    y_ny = deval(sol,result2(1,:));
    diff = abs(result2(3,:)-y_ny(2,:));

    %Läs doc för att fatta interp1 har inte gjort än :(
    % y_interpolate = interp1(result2(1,:),result2(3,:),tv);
    % 
    % % ska ta skillnaden mellan dem
    % diff = abs(yv(:,2)-y_interpolate);
    % %spotar ut sig NaN, måste hanteras
    % diff(isnan(diff)) = 0;
    % % skriver ut fel
    Maxfel = max(diff)
    Minfel = min(diff)
    Avgfel = mean(diff)
    

    %Lopping funkar inte riktigt lol
    title(titlevek(ii))
    xlabel('Tid (s)')
    ylabel('Abs fel')
    subplot (4,1,ii)
    plot(result2(1,:),diff)
    hold on
end
 hold off

