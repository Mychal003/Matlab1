%% Generacj liczb pseudolosowych - pierwszy program
% Generacja liczb pseudolosowych o rozkładzie narmalnym i rysowanie histogramu
clear all; close all; clc

%% Generacja liczb pseudolosowych

N = 1000
x = randn(N,1);
%% Histofram

histogram(x,50)                 % k = 50 - liczba przedziałów histogramu

title('Histogram liczb pseudolosowych');
xlabel('Wartość zmiennej [-]');
ylabel('Liczność [-]');
grid on;



