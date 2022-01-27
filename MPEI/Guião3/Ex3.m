clear all;
clc;

%% a)
%Confirme que a matriz de transic¸ao de estados e estocastica.

T = rand(20);
T = T./sum(T);

%% b)
%Qual a probabilidade de o sistema, comec¸ando no estado 1, 
% estar no estado 20 apos 2 transicoes? E apos 5? E apos 10?
% E apos 100? Apresente os resultados em percentagem e com
% 5 casas decimais. O que conclui?

V0 = [1 zeros(1, length(T) - 1)]';
M2 = T^2 * V0;
P2 = M2(20) * 100;

fprintf('Resultado: %6.5f %% \n', P2);
