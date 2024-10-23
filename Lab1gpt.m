%% Laboratorium - Przygotowanie modelu termicznego

clc; clear all; close all;

%% 1. Wyznaczenie parametrów modelu

% Wartości nominalne
TzewN = -20;  % Temperatura zewnętrzna [°C]
Tl_nominal = 20; % Nominalna temperatura w lewym pokoju [°C]
Tp_nominal = 15; % Nominalna temperatura w prawym pokoju [°C]

a = 2; % Współczynnik przenikania ciepła [W/°C]
B = 5; % Grubość ściany działowej [m]
Pgn = 10000; % Moc grzałki [W]

% Wymiary pokoi
x = (50 / B * 2 + 5) / 3;
y = (x - 5) / 2;

Vp = B * x * 3; % Objętość prawego pokoju [m^3]
Vl = B * y * 3; % Objętość lewego pokoju [m^3]

% Parametry powietrza
Cp = 1000; % Ciepło własciwe powietrza [J/(kg*K)]
rop = 1.2; % Gęstość powietrza [kg/m^3]

% Pojemności cieplne
Cvp = Cp * rop * Vp; % Pojemność cieplna prawego pokoju [J/°C]
Cvl = Cp * rop * Vl; % Pojemność cieplna lewego pokoju [J/°C]

%% 2. Obliczenie punktu pracy (punkt równowagi)

% Przewodności cieplne między pomieszczeniami
Ksp = Pgn / (a * (Tl_nominal - TzewN) + (Tp_nominal - TzewN));
Ksl = a * Ksp;
Ksw = Ksp * (Tp_nominal - TzewN) / (Tl_nominal - Tp_nominal); % Przewodność cieplna między pokojami

% Punkt równowagi dla Tl i Tp
Tl_eq = (Pgn + Ksl * TzewN + Ksw * Tp_nominal) / (Ksl + Ksw);
Tp_eq = (Ksw * Tl_nominal + Ksp * TzewN) / (Ksw + Ksp);

%% 3. Sprawdzenie poprawności obliczeń (punkt pracy = wartości nominalne)

% Porównanie wartości obliczonych z nominalnymi
disp('Obliczone wartości punktu pracy:');
disp(['Temperatura w lewym pokoju (Tl_eq) = ', num2str(Tl_eq), '°C']);
disp(['Temperatura w prawym pokoju (Tp_eq) = ', num2str(Tp_eq), '°C']);

disp('Nominalne wartości:');
disp(['Temperatura nominalna w lewym pokoju (Tl_nominal) = ', num2str(Tl_nominal), '°C']);
disp(['Temperatura nominalna w prawym pokoju (Tp_nominal) = ', num2str(Tp_nominal), '°C']);

% Sprawdzenie czy obliczone wartości są równe nominalnym
if abs(Tl_eq - Tl_nominal) < 1e-3 && abs(Tp_eq - Tp_nominal) < 1e-3
    disp('Punkt pracy zgadza się z wartościami nominalnymi.');
else
    disp('Punkt pracy NIE zgadza się z wartościami nominalnymi.');
end

%% 4. (Opcjonalnie) Zastosowanie równań stanu

% Macierze równań stanu (przykład z dwoma temperaturami)
A = [-Ksl/Cvl, Ksw/Cvl;
      Ksw/Cvp, -Ksp/Cvp];

B = [1/Cvl; 0];  % Wpływ mocy grzałki na temperaturę Tl
C = eye(2);      % Wyjściem są oba stany (Tl, Tp)
D = [0; 0];      % Brak bezpośredniego wpływu wejść na wyjścia

% Wyświetlenie macierzy równań stanu
disp('Macierz A:');
disp(A);

disp('Macierz B:');
disp(B);

disp('Macierz C:');
disp(C);

disp('Macierz D:');
disp(D);

% Teraz można analizować dynamikę systemu, np. symulując układ w Simulinku
