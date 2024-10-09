x = -10:1:10;
figure;
hold on;
grid on;

a = -2;

a_values = -2:0.5:2; %Wektor wartoci parametru a
colors = 'rgbc'; %Lista kolorów

for i = 1:length(a_values)
    a = a_values(i);
    color_idx = mod(i-1, length(colors))+1; %Mod do wybierania koloru
    plot(x, a*x.^2, colors(color_idx)) %Wybieranie funkcji w wybranym kolorze
end

title('Wykres funkcji 2ax dla różnych wartości parametru a');
xlabel('Oś X');
ylabel('Oś Y');

legend(arrayfun(@(a) sprintf('a = %.1f', a), a_values, 'UniformOutput', false));  % Legenda
hold off;

