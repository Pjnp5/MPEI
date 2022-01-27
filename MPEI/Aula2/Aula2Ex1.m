%a)
fprintf("A)");

N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 0;   %numero de filhos rapazes
n = 2;   %numero total de filhos

filhos = rand(n,N) > p;
rapazes = sum(filhos)==k;
probSimulacao = 1 - sum(rapazes)/N


%b)
fprintf("B)");

probT = 1 - factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k)

%c)
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
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 2;   %numero total de filhos

probTeorica = factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k);

%P(B)
k = 0;

probTeoricaB = 1 - (factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k));

probTeoricaFinal = probTeorica/probTeoricaB

%D)
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

%E)
fprintf("E)");

%A -> Outro,e apenas mais um, filho tambem e rapaz
%B -> Pelo menos um dos filhos e rapaz
%Queremos: P(A|B) = P(AB)/P(B)
%Onde sabemos que P(AB) simboliza "Temos 2 filhos rapazes"

%P(AB)
N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 5;   %numero total de filhos (total sao 5 mas sabemos que um ja e rapaz)

filhos = rand(n,N) > p;
rapazes = sum(filhos)==k;
probSimulacao = sum(rapazes)/N;

%P(B)
k = 1;
rapazes = sum(filhos)>=k;
probSimulacaoB = sum(rapazes)/N;

probSimulacaoFinal = probSimulacao/probSimulacaoB

%F)
fprintf("F)");

%A -> Pelo menos mais um filho tambem e rapaz
%B -> Pelo menos um dos filhos e rapaz
%Queremos: P(A|B) = P(AB)/P(B)
%Onde sabemos que P(AB) simboliza "Temos,no minimo, 2 filhos rapazes"

%P(AB)
N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de ter um filho rapaz
k = 2;   %numero de filhos rapazes
n = 5;   %numero total de filhos (total sao 5 mas sabemos que um ja e rapaz)

filhos = rand(n,N) > p;
rapazes = sum(filhos)>=k;
probSimulacao = sum(rapazes)/N;

%P(B)
k = 1;
rapazes = sum(filhos)>=k;
probSimulacaoB = sum(rapazes)/N;

probSimulacaoFinal = probSimulacao/probSimulacaoB