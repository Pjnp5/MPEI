clear all;
clf;
close;
%% A

% O servidor recebe em média 15 msg por seg logo
lambda = 15;
% Pretendemos saber a probabilidade de o servidor não receber msg num seg
k = 0

Prob_zero_msg = leiPoisson(lambda, k);

fprintf("A prob de o servidor não receber mensagens no espaço de um segundo é %d", Prob_zero_msg)
%% B
% É mais facil calcular o complemento (chegar 10 ou menos mensagens ao computador)

pX = zeros(1,11)

for k = 0 : 10
  i = k+1; % Como em matlab os arrays começam em 1 temos de fazer isto
  pX(i) = leiPoisson(m,k);
end

Prob_de_10_ou_menos = sum(pX);
Prob_mais_de_10 = 1- Prob_de_10_ou_menos;

fprintf("P(O computador recebe mais de 10 mensagens) = %f\n",Prob_mais_de_10);