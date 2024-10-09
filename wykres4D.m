[x, y] = meshgrid(-2:0.2:2, -2:0.2:2);  % Siatka punktów w przestrzeni
z = x .* exp(-x.^2 - y.^2);  % Obliczenie wartości funkcji z

figure;
mesh(x, y, z);  % Rysowanie wykresu 3D
title('Wykres funkcji z = x \cdot exp(-x^2 - y^2)');
xlabel('Oś X');
ylabel('Oś Y');
zlabel('Oś Z');

x = -10:0.1:10;  % Dziedzina

figure;
hold on;
grid on;

% Pętla dla różnych wartości parametru a
for a = -2:0.5:2
    y = (a * x.^2 + 1) ./ (x + 2);  % Przykładowa funkcja
    plot(x, y);
end

title('Rodzina wykresów dla funkcji parametrycznych');
xlabel('Oś X');
ylabel('Oś Y');
legend(arrayfun(@(a) sprintf('a = %.1f', a), -2:0.5:2, 'UniformOutput', false));
hold off;

