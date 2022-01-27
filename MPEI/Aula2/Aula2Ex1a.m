fprintf("A");

N = 1e5; % Numero de experiencias
p = 0.5; % Probabilidade de ter um filho rapaz
k = 0;   % numero de filhos rapazes
n = 2;   % numero total de filhos

filhos = rand(n,N) > p;
rapazes = sum(filhos)==k;
probSimulacao = 1 - sum(rapazes)/N