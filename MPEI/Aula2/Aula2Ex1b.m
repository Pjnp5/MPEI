fprintf("B")

N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 0;   %numero de filhos rapazes
n = 2;   %numero total de filhos

probT = 1 - factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k)