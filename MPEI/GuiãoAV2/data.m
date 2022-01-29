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
clear a;

K = 100;  % Número de funções de dispersão
MinHashInt = inf(Nu, K);
for i = 1:Nu
    conjunto = friends{i};                      % conjunto dos amigos do user
    idades = zeros(length(conjunto), 1);        % idades dos amigos
    for j = 1:length(conjunto)
        idades(j) = dic{conjunto(j), 4};        % idade do j
        chave = char(idades(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashInt(i,:) = min([MinHashInt(i,:); hash]);  % Valor minimo da hash para este título
    end
end

shingle_size = 4;
K = 150;  % Número de funções de dispersão
MinHashSearch = inf(Nu,K);
for i = 1:Nu
    nome = lower([dic{i,2} ' ' dic{i,3}]);
    shingles = {};
    for j = 1 : length(nome) - shingle_size + 1  % Criacao dos shingles para cada filme
        shingle = nome(j:j + shingle_size - 1);
        shingles{j} = shingle;
    end
    
    for j = 1:length(shingles)
        chave = char(shingles(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashSearch(i,:) = min([MinHashSearch(i,:);hash]);  % Valor minimo da hash para este shingle
    end
end

save 'data' 'dic' 'Nu' 'users' 'friends' 'MinHashInt' 'MinHashSearch'