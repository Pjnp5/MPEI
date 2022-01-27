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
clear; clc;
n = 8000;
B = Inicializar(n);

N = 1000;
alpha = 'a':'z';
U1 = Gera_chave(N, 3, 10, alpha);
for i = 1:N
    for k = 4:10
        B = Inserir(U1{i}, B, k);
    end
end
U2 = Gera_chave(10000, 3, 10, alpha);
count = zeros(1, 7);
fp = 0;
for i = 1:10000
    for k = 4:10
        fp = verificar(U2{i}, B, k, fp);
        count(k-3) = count(k-3) + fp;
    end
end
fpp = zeros(1, 7);
for i = 1:7
    fpp(i) = count(i)/10000 * 100;
end

figure(1);
stem((4:10), fpp)

a = (1 - 1/n).^N;
k_otimo = log(1/2) / log(a)

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


