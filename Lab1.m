%% Laboratorium 1
clc; clear all; close all;
% wartości nominalne
TzewN =-20; % temp zewn
a=2; % Współczynnik przenikania ciepla
Pgn = 10000; % moc grzałki w [w]
Tv1 = 20; %temp w 1 pokoju
Tv2 = 15; %temp w 2gim pokoju
Vl = 150; % objętość mieszkania, 50x3
Vp 
Cp=1000; rop=1.2 % ciepło właściwe powietrza

Ks2=Pgn./(a.*(Tv1-TzewN)+Tv2-TzewN);
Ks1 = a.*Ks2;
Ks0 = Ks2.*(Tv2-TzewN)./(Tv1-Tv2);


Cv1 = (Pgn - Ks1.*(Tv1-TzewN) - Ks0.*(Tv1-Tv2))./Tv1; % objętość cieplna
Cv2 = (Ks0 .*(Tv1-Tv2)-Ks2.*(Tv2-TzewN))./Tv2;
Cv1=Cp.*rop.*;


%% 2 część pracy
% Warunki początkowe:
Tzew0=TzewN+0;
Pg0=Pgn+0;
a0=a+0;

Tv1=