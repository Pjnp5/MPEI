fprintf("D)");

%A -> O outro filho tambem e rapaz (segundo)
%B -> O primeiro filho e rapaz = 0.5
%Queremos: P(A|B) = P(AB)/P(B)
%Onde sabemos que P(AB) simboliza "Ambos os filhos sao rapazes"

%Por teoria:

%P(AB)
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 2;   %numero total de filhos

probTeorica = factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k);

%P(B) = 0.5

probTeoricaFinal = probTeorica/0.5

%Por Simulacao:

%P(AB)
N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 2;   %numero total de filhos

filhos = rand(n,N) > p;
rapazes = sum(filhos)==k;
probSimulacao = sum(rapazes)/N;

%P(B)
k = 1;
primeiroRapaz = sum(filhos(1,:)==k);
probSimulacaoB = sum(primeiroRapaz)/N;

probSimFinal = probSimulacao/probSimulacaoB