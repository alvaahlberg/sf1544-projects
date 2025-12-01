
%4a
konst = values;
konst(4) = 100*konst(4);
A_styv = matrixA(konst);

v0 = [0;0;0;0];
t = input("Hur långt tid ska du gå över?: ");
tspan = [0.000000001,t];

h = 0.00011181 * [1; 10; 100];

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

title('Implicita trapetsmetoden')
xlabel('Tid (s)')
ylabel('Förskjutning (m)')
legend('1', '10','100')

hold off