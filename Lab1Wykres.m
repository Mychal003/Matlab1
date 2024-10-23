clc; clear all; close all;

% Wartości nominalne
TzewN = -20; % Temperatura zewnętrzna [°C]
a = 2; % Współczynnik przenikania ciepła
B = 5; % Grubość ściany działowej [m]
Pgn = 1000000; % Moc grzałki [W]
Tl = 20; % Nominalna temperatura w 1 pokoju [°C]
Tp = 15; % Nominalna temperatura w 2 pokoju [°C]

% Obliczenia
x = (50 / B * 2 + 5) / 3;
y = (x - 5) / 2;
Vp = B * x * 3; % Objętość prawego pokoju [m^3]
Vl = B * y * 3; % Objętość lewego pokoju [m^3]
Cp = 1000; % Ciepło właściwe powietrza [J/(kg*K)]
rop = 1.2; % Gęstość powietrza [kg/m^3]

Cvl = Cp * rop * Vp; % Pojemność cieplna prawego pokoju
Cvp = Cp * rop * Vl; % Pojemność cieplna lewego pokoju

Ksp = Pgn ./ (a * (Tl - TzewN) + Tp - TzewN); % Przewodność cieplna dla prawego pokoju
Ksl = a * Ksp; % Przewodność cieplna dla lewego pokoju
Ksw = Ksp * (Tp - TzewN) / (Tl - Tp); % Przewodność cieplna między pokojami

% Obliczenie punktu pracy - rozwiązanie układu równań dla stanu ustalonego
syms Tl_eq Tp_eq

% Statyczne równania dla Tl i Tp
eq1 = (Pgn - Ksl * (Tl_eq - TzewN) - Ksw * (Tl_eq - Tp_eq)) == 0;
eq2 = (Ksw * (Tl_eq - Tp_eq) - Ksp * (Tp_eq - TzewN)) == 0;

% Rozwiązanie układu równań
sol = solve([eq1, eq2], [Tl_eq, Tp_eq]);

Tl_eq = double(sol.Tl_eq);
Tp_eq = double(sol.Tp_eq);

disp(['Temperatura w lewym pokoju (punkt pracy): ', num2str(Tl_eq)]);
disp(['Temperatura w prawym pokoju (punkt pracy): ', num2str(Tp_eq)]);

% Sprawdzenie zgodności z wartościami nominalnymi
if abs(Tl_eq - 20) < 1e-3 && abs(Tp_eq - 15) < 1e-3
    disp('Punkt pracy zgodny z wartościami nominalnymi.');
else
    disp('Punkt pracy nie jest zgodny z wartościami nominalnymi.');
end

% Symulacja zmian temperatury w czasie
czas_symulacji = 100000000; % czas symulacji [s]
dt = 1; % krok czasowy [s]
n = czas_symulacji / dt; % liczba kroków
Tl_hist = zeros(1, n); % historia temperatury Tl
Tp_hist = zeros(1, n); % historia temperatury Tp

Tl_hist(1) = Tl; % warunek początkowy Tl
Tp_hist(1) = Tp; % warunek początkowy Tp

for i = 2:n
    % Prosta aktualizacja temperatur
    dTl = (Pgn - Ksl * (Tl_hist(i-1) - TzewN) - Ksw * (Tl_hist(i-1) - Tp_hist(i-1))) / Cvl * dt;
    dTp = (Ksw * (Tl_hist(i-1) - Tp_hist(i-1)) - Ksp * (Tp_hist(i-1) - TzewN)) / Cvp * dt;
    
    Tl_hist(i) = Tl_hist(i-1) + dTl; % Aktualizacja temperatury Tl
    Tp_hist(i) = Tp_hist(i-1) + dTp; % Aktualizacja temperatury Tp
end

% Wykres
czas = 0:dt:czas_symulacji-dt;
figure;
plot(czas, Tl_hist, 'r', 'DisplayName', 'Temp lewego pokoju');
hold on;
plot(czas, Tp_hist, 'b', 'DisplayName', 'Temp prawego pokoju');
xlabel('Czas [s]');
ylabel('Temperatura [°C]');
title('Zmiana temperatury w czasie');
legend;
grid on;
