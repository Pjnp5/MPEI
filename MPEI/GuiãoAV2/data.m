clear all; clc;
dic = readcell('utilizadores.txt', 'Delimiter', ';');

amigos = load('amigos.txt');
a = amigos(:, 1:2);
clear amigos;
users = unique(a(:, 1));
Nu = length(users); 

friends = cell(Nu, 1); % Usa celulas
for n = 1:Nu % Para cada utilizador
    % Obtem os amigos de cada um
    ind = find(a(:, 1) == users(n));
    friends{n} = [friends{n} a(ind, 2)];
end
%clear a

K = 100;  % Número de funções de dispersão
MinHashValue = inf(Nu, K);
for i = 1:Nu
    conjunto = friends{i}; 
    for j = 1:length(conjunto)
        chave = char(conjunto(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 0);
        end
        MinHashValue(i,:) = min([MinHashValue(i,:); hash]);  % Valor minimo da hash para este título
    end
end

shingle_size = 3;
K = 150;  % Número de funções de dispersão
MinHashSig = inf(length(friends),K);
for i = 1:length(friends)
    conjunto = lower(friends{i,1});
    shingles = {};
    for j = 1 : length(conjunto) - shingle_size+1  % Criacao dos shingles para cada filme
        shingle = conjunto(j:j+shingle_size-1);
        shingles{j} = shingle;
    end
    
    for j = 1:length(shingles)
        chave = char(shingles(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashSig(i,:) = min([MinHashSig(i,:);hash]);  % Valor minimo da hash para este shingle
    end
end

save 'data' 'dic' 'Nu' 'users' 'friends'