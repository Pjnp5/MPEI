fprintf("C)");
%A -> O outro filho tambem e rapaz
%B -> Um dos filhos e rapaz
%Queremos: P(A|B) = P(AB)/P(B)
%Onde sabemos que P(AB) simboliza "Ambos os filhos sao rapazes"

%Por simulacao:
%P(AB):
N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 2;   %numero total de filhos

filhos = rand(n,N) > p;
rapazes = sum(filhos)==k;
probSimulacao = sum(rapazes)/N;

%P(B)
k = 1;
rapazes = sum(filhos)>=k; %Pois queremos a prob. de ter PELO MENOS um filho (ou seja k == 1 ou k == 2)
probSimulacaoB = sum(rapazes)/N;

probSimFinal = probSimulacao/probSimulacaoB

%Por teoria:

%P(AB)
p = 1/2; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 2;   %numero total de filhos

probTeorica = factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k);

%P(B)
k = 0;

probTeoricaB = 1 - (factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k));

probTeoricaFinal = probTeorica/probTeoricaB