%% Generacj liczb pseudolosowych - pierwszy program
% Generacja liczb pseudolosowych o rozkładzie narmalnym i rysowanie histogramu
clear all; close all; clc

%% Generacja liczb pseudolosowych

N = 1000
x = randn(N,1);

x_2 = randn(N,1);

x_3 = x .^2;

%% Histofram

histogram(x_2,50)                 % k = 50 - liczba przedziałów histogramu

title('Histogram liczb pseudolosowych');
xlabel('Wartość zmiennej [-]');
ylabel('Liczność [-]');
grid on;

figure; histogram(x_3,50)                 % k = 50 - liczba przedziałów histogramu

title('Histogram liczb pseudolosowych');
xlabel('Wartość zmiennej [-]');
ylabel('Liczność [-]');
grid on;