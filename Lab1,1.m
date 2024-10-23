%% Laboratorium 1
clc; clear all; close all;
% wartosci nominalne
TzewN = -20; % temp zewn
a = 2; % Wspolczynnik przenikania ciepla
B = 5 % Grubosc sciany dzialowej
Pgn = 10000; % moc grzalki w [w]
Tl = 20; %temp w 1 pokoju
Tp = 15; %temp w 2gim pokoju
x = (50 / B * 2 + 5) / 3
y = (x - 5) / 2
Vp = B * x * 3; %Objetosc prawgo pokoju
Vl = B * y * 3; %Objetosc lewgo pokoju
Cp = 1000; rop = 1.2 % cieplo wlasciwe powietrza

Cvl = Cp * rop * Vp;
Cvp = Cp * rop * Vl;

Ksp = Pgn ./ (a .* (Tl - TzewN) + Tp - TzewN);
Ksl = a .* Ksp;
Ksw = Ksp .* (Tp - TzewN) ./ (Tl - Tp); %Przewodnosc temperatury pomiedzy
%Cvl = (Pgn - Ksl.*(Tl-TzewN) - Ksw.*(Tl-Tp))./Tl; % objetosc cieplna
%Cvp = (Ksw .*(Tl-Tp)-Ksp.*(Tp-TzewN))./Tp;

% Warunki początkowe:
Tzew0 = TzewN+0;
Pg0 = Pgn+0;
a0 = a+0;

% Stan rwnowagi
Tl0 = (Pg0 + Ksl .* Tzew0 + Ksw .* Tp) ./ (Cvl .*(1 + Ksl + Ksw));
Tp0 = (Ksw .* Tl + Ksp .* Tzew0) ./ (Cvp .* (1 + Ksw + Ksp));

% Symulacja
czas = 50000;
t0 = 0;
[t] = sim('Lab1_sim.slx', czas);
figure,plot(t.tout, t.oTl);
figure,plot(t.tout, t.oTp);