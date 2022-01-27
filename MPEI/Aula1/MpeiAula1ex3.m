%%Ex2

N= 1e5; %nu´mero de experieˆncias
p = 0.5; %probabilidade de cara
k = 6; %numero de caras
n = 15; %numero de lanc¸amentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)>=k;
probSimulacao = sum(sucessos)/N

%%Ex4

for n = [20, 40, 100]
    for k = 0:n
        MpeiAula1ex4(0.5, n, k, 1e5)
    end
end
%% Ex4b
n = 20;
for k = 0:n
    p(k+1) = MpeiAula1ex4(0.5, n, k, 1e5);
end
stem(0:n, p)