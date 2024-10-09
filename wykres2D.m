x = -10:1:10;  % Wartości osi x
figure;        % Nowe okno wykresu
hold on;       % Trzymanie wszystkich wykresów na jednym oknie
grid on;       % Włączenie siatki

% Pętla po wartościach parametru a
for a = -2 : 0.5 : 2
    plot(x, a*x.^2);  % Rysowanie funkcji a*x^2
end

% Opisy wykresu
title('Wykres funkcji 2ax dla różnych wartości parametru a');
xlabel('Oś X');
ylabel('Oś Y');

hold off;
