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
k = 1; % o denominador é todas as familias com 1 ou mais rapazes 
rapazes = sum(filhos)>=k;
probSimulacaoB = sum(rapazes)/N;

probSimulacaoFinal = probSimulacao/probSimulacaoB
%Familias com 2 rapazes/familias com 1 ou mais rapazes = probabilidade de 
