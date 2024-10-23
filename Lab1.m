%% Laboratorium 1
clc; clear all; close all;

% Wartości nominalne
TzewN = -20; % Temperatura zewnętrzna [°C]
a = 2; % Współczynnik przenikania ciepła [W/m^2*K]
B = 5; % Grubość ściany działowej [m]
Pgn = 10000; % Moc grzałki [W]
Tl = 20; % Temperatura w 1 pokoju [°C]
Tp = 15; % Temperatura w 2 pokoju [°C]

% Obliczenia
x = (50 / B * 2 + 5) / 3;
y = (x - 5) / 2;
Vp = B * x * 3; % Objętość prawego pokoju [m^3]
Vl = B * y * 3; % Objętość lewego pokoju [m^3]
Cp = 1000; % Ciepło właściwe powietrza [J/(kg*K)]
rop = 1.2; % Gęstość powietrza [kg/m^3]

Cvl = Cp * rop * Vp; % Pojemność cieplna powierza prawego pokoju [J/K]
Cvp = Cp * rop * Vl; % Pojemność cieplna powiertrza lewego pokoju [J/K]

%Przenikalność cieplna pomiędzy otoczenem a pomieszczeniem
Ksp = Pgn / (a * (Tl - TzewN) + Tp - TzewN); % Przewodność cieplna dla prawego pokoju (grzałka-otoczenie)
Ksl = a * Ksp; % Przewodność cieplna ściany zewnętrznej pokoju lewego
Ksw = Ksp * (Tp - TzewN) / (Tl - Tp); % Przewodność cieplna między pokojami

% Warunki początkowe
Tzew0 = TzewN; % Początkowa zewnętrzna [°C]
Pg0 = Pgn; %  Początkowa moc grzałki [W]
a0 = a; % Początkowy współczynnik przenikania ciepła [W/m^2*K]

% Stan równowagi - obliczenia temperatury

Tl0 = (Pg0 + Ksl * Tzew0 + Ksw * Tp) / (Cvl * (1 + Ksl + Ksw)); % Temperatura równowagi w pokoju lewym [°C]
Tp0 = (Ksw * Tl + Ksp * Tzew0) / (Cvp * (1 + Ksw + Ksp)); % Temperatura równowagi w pokoju prawym [°C]

% Symulacja
czas = 50000;    % Czas symulacji [s]
t0 = 0;          % Czas początkowy [s]

% Wywołanie symulacji w Simulinku (model Lab1_sim.slx)
[t] = sim('Lab1_sim.slx', czas);

% Wykresy wyników symulacji
figure, plot(t.tout, t.oTl);    % Wykres temperatury w pokoju lewym
title('Temperatura w pokoju lewym');
xlabel('Czas [s]');
ylabel('Temperatura [°C]');

figure, plot(t.tout, t.oTp);    % Wykres temperatury w pokoju prawym
title('Temperatura w pokoju prawym');
xlabel('Czas [s]');
ylabel('Temperatura [°C]');

















