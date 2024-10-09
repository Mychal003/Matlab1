% Definicja macierzy  A i B
A = [1, 2, 3; 4, 5, 6]; % 2x3
B = [7, 8; 9, 10; 11, 12]; % 3x2

% Mnożenie macierzy A*B (macierzowe)
% liczba kolumn musi być równa liczbie wierszy

C = A*B; 

% Aby wykonać mnożenie elementowe, macierze muszą mieć te same wymiary.
% Definiujemy nowe macierze o tych samych wymiarach
A_el = [1, 2, 3; 4, 5, 6]; % Macierz 2x3
B_el = [7, 8, 9; 10, 11, 12]; % Macierz 
% Elementowe mnożenie macierzy (A .* B)
D = A_el .* B_el;

% Wyświetlenie wyników
disp('Wynik mnożenia macierzy A*B:');
disp(C);

disp('Wynik mnożenia elementowego A.*B:');
disp(D);

