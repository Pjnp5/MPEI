%% a)
% Defina em Matlab a matriz de transic¸ao de estados T,
% com Tij sendo a probabilidade de ir do estado j para
% o estado i num unico passo.

  %  1   2   4   3   5
T = [0.8 0   0.3 0 0
     0.2 0.6 0.2 0 0
     0   0.3 0   1 0
     0   0.1 0.4 0 0
     0   0   0.1 0 1];
%% b)
%Faca um grafico com a probabilidade de, comecando no estado 1
% ,estar no estado 2 ao fim de n passos, com n a variar de
% 1 ate 100. Justifique o que observa

N = 100;
P12 = zeros(1, N);
V = [1 0 0 0 0];

for n = 1:N
    T = T^n;
    P12(n) =T(2,1);
end

%plot(1:N, P12)

%% c)
%Faca um grafico com a probabilidade de, comec¸ando no estado 1,
% estar no estado 3 ao fim de n passos. Na mesma figura, faca
% um segundo grafico com a probabilidade de, comec¸ando no
% estado 1, estar no estado 5 ao fim de n passos. Em ambos os
% casos, considere n a variar de 1 ate 100. Justifique o que
% observa.

T = [ 0.8   0      0.3   0   0 
      0.2   0.6    0.2   0   0 
      0     0.1    0.4   0   0 
      0     0.3    0     1   0 
      0     0      0.1   0   1 ];

N = 100;
P1 = zeros(1, N);
P2= zeros(1, N);

V = [1 0 0 0 0]';

for n = 1:N
    % Vn = T^nV;
    % P(n) = Vn(2);
    Vn = T^n;
    P1(n) = Vn(3,1);
    P2(n) = Vn(5,1);
end 

plot(1:N, P1, '*')
plot(1:N, P2, '-')

%% d)
%Determine a matriz Q.

ena = 3 %estados nao absorventes
Q = T(1:ena, 1:ena)

F = inv(eye(size(Q)) - Q)

%% e)
%Determine a matriz fundamental F.

%F = (eye(size(Q) - Q))^(-1)

%% f)
%Qual a media (valor esperado) do numero de passos ate a
% absorcao comecando no estado 1? E comecando no estado 2?
% E se comec¸ando no estado 4?

passos = sum(F);
f1 = passos(1);
f2 = passos(2);
f3 = passos(3); % e o estado 4, mas é a cena 3 na matriz

%% g)
%Comec¸ando no estado 1, qual e a probabilidade de absorcao
% do estado 3? E do estado 5? Verifique a coerencia destes
% valores com o que observou na alınea 6c).

%R = ((ena+1):end, 1:ena)
R = T(4:5, 1:3);
B = R * F;
r1 = B(1,1)
r2 = B(2,1)

[P1(end) P2(end)]

