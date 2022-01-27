clear all;
clf;
close;
% Prob de haver um erro numa pag de um livro é 0.02
% Logo, em média, há 2 erros por 100 páginas
lambda = 2;
% numero max de erros em 100 pag
n_pags = 100;
max_erros = 1;

prob = 0
for k = [0 1]
  i = k+1 % Como em matlab os arrays começam em 1 temos de fazer isto
  prob(i) = leiPoisson(lambda,k)
end

prob_de_maximo_1_erro = sum(prob)