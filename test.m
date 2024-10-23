%% Laboratorium 1
clc; clear all; close all;
%% 1. Parametry modelu

% wartosci nominalne
TzewN = -20; % temperatura zewnętrzna
a = 2; % Wspolczynnik przenikania ciepla
B = 5; % Grubosc sciany dzialowej
Pgn = 10000; % moc grzalki w [w]
Tl = 20; %temp w 1 pokoju [°C]
Tp = 15; %temp w 2-gim pokoju [°C]

% obliczenia pomocnicze (pokoje)
x = (50 / B * 2 + 5) / 3;
y = (x - 5) / 2;

% Objętość pokoi
Vp = B * x * 3; % Objętość prawego pokoju [m^3]
Vl = B * y * 3; % Objetosc lewgo pokoju [m^3]
Cp = 1000; % Gęstość powietrza powietrza [J/(kg*K)]
rop= 1.2; % Gęstość powietrza  [kg/m^3]

% Pojemności cieplne
Cvl = Cp * rop * Vp; % Pojemność cieplna lewego pokoju
Cvp = Cp * rop * Vl; % Pojemność cieplna prawegi pokoju

% Przewodności cieplne
Ksp = Pgn / (a * (Tl - TzewN) + Tp - TzewN);
Ksl = a * Ksp;
Ksw = Ksp * (Tp - TzewN) / (Tl - Tp); % Przewodność temperatury między pokojami
%Cvl = (Pgn - Ksl.*(Tl-TzewN) - Ksw.*(Tl-Tp))./Tl; % objetosc cieplna
%Cvp = (Ksw .*(Tl-Tp)-Ksp.*(Tp-TzewN))./Tp;

% Warunki początkowe:
Tzew0 = TzewN+0; % Początkowa temp. zewnętrzna
Pg0 = Pgn+0; % Początkowa moc grzałki
a0 = a+0; % Początkowy współczynnik przenikania ciepł

% Stan rwnowagi
Tl0 = (Pg0 + Ksl * Tzew0 + Ksw * Tp) / (Cvl *(1 + Ksl + Ksw)); % Temp. lewego pokoju
Tp0 = (Ksw .* Tl + Ksp .* Tzew0) / (Cvp * (1 + Ksw + Ksp)); % Temp. prawego pokoju

% Symulacja

%czas = 50000;
%t0 = 0;
%[t] = sim('Lab1_sim.slx', czas);
%figure,plot(t.tout, t.oTl);
%figure,plot(t.tout, t.oTp);

% Rysowanie wyników
%figure, plot(t.tout, t.oTl);
%title('Temperatura w lewym pokoju');
%xlabel('Czas [s]');
%ylabel('Temperatura [°C]');

%figure, plot(t.tout, t.oTp);
%title('Temperatura w prawym pokoju');
%xlabel('Czas [s]');
%ylabel('Temperatura [°C]');