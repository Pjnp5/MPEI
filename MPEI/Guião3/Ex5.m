clear all;
clc;

%% a)
%Defina, em Matlab, a correspondente matriz de transic¸ao

T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];

%% b)
%Qual a probabilidade de estar sol no segundo dia e no terceiro
% dia de janeiro quando o primeiro dia e de sol?

% P(X2 = sol && X3 = sol | X1 = sol)
% P(sol1) * P(sol2 | sol1) * P(sol3 | sol2)
P = 1*T(1,1) * T(1,1);

%% c)
%Qual a probabilidade de nao chover nem no segundo dia nem no
% terceiro dia de janeiro quando o primeiro dia e de sol?

% P(X2 = !chuva && X3 = !chuva | X1 = sol)
% = 1 - P(X2 = chuva && X3 = chuva | X1 = sol)

V1 = [1 0 0]';
V2 = T * V1;
V = [1/2 1/2 0]; % não chuva
V3 = T * V;
P = (1 - V2(3)) * (1 - V3(3));

%% d)
%Assumindo que o primeiro dia e de sol, determine o numero
%medio de dias de sol, de nuvens e de chuva que se espera
%ter em todo o mes de janeiro.

