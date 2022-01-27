fprintf("F)");

%A -> Pelo menos mais um filho tambem e rapaz
%B -> Pelo menos um dos filhos e rapaz
%Queremos: P(A|B) = P(AB)/P(B)
%Queremos saber a probabilidade de ter pelo menos 2 rapazes sabendo que dos
%5 um deles é rapaz

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