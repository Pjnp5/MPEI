clear all;
clc;

%% a)
%Defina, em Matlab, a matriz de transicao de estados T assumindo
%p = 0, 4 e q = 0, 6.

p = 0.4;
q = 0.6;

T = [p^2 (1 - p)^2 p*(1 - p) p*(1 - p)
     0 0 0 1
     0 0 0 1
     q^2 q(q - 1) q*(1- q) (1 - q)^2];

%% b)
%Assuma que o sistema se encontra inicialmente no estado A.
% Qual a probabilidade de estar em cada estado ao fim de
% 5 transicoes? E de 10 transicoes? E de 100 transicoes?
% E de 200 transicoes?

V0 = [1 0 0 0]';
P5 = T^5 * V0;
P10 = T^10 * V0;
P100 = T^100 * V0;
P200 = T^200 *V0;

%% c)
%Determine as probabilidades limite de cada estado.
% Compare estes valores com os obtidos na alınea anterior.
% O que conclui?

M = [T - eye(size(T));
     ones(1, length(T))];

x = [zeros(1, length(T))];

P_lin = M/x;

