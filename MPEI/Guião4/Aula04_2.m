%% 
clear; clc;
n = 8000;
k = 3;
B = Inicializar(n);

N = 1000;
alpha = 'a':'z';
U1 = Gera_chave(N, 3, 10, alpha);
for i = 1:N
    B = Inserir(U1{i}, B, k);
end
stem(B)
sum(B)
fp = 0;
for i = 1:N
    fp = verificar(U1{i}, B, k, fp);
end
%% 
U2 = Gera_chave(10000, 3, 10, alpha);
count = 0;
fp = 0;
for i = 1:10000
    fp = verificar(U2{i}, B, k, fp);
    count = count + fp;
end
fpp = count/10000

fpt = (1 - exp(-k * N/n)).^k

%% 
for k = 4:10
    

%% Testes
sum(B)
stem(B)

elem = {'Aveiro', 'Porto', 'Coimbra'};

for i = 1:length(elem)
    B = Inserir(elem{i}, B, k)
end

stem(B);
sum(B)

elem = {'Aveiro', 'Porto', 'Braga'};

for i = 1:length(elem)
    B = verificar(elem{i}, B, k);
end


