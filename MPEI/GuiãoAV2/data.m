clear all; clc;
dic = readcell('utilizadores.txt', 'Delimiter', ';');

amigos = load('amigos.txt');
a = amigos(:, 1:2);
clear amigos;
users = unique(a(:, 1));
Nu = length(users); 

friends = cell(Nu, 1); 
for n = 1:Nu 
    ind = find(a(:, 1) == users(n));
    friends{n} = [friends{n} a(ind, 2)];
end
clear a;

K = 100;  
MinHashInt = inf(Nu, K);
for i = 1:Nu
    amigos = friends{i};                      
    idades = zeros(length(amigos), 1);       
    for j = 1:length(amigos)
        idades(j) = dic{amigos(j), 4};       
        key = char(idades(j));
        hash = zeros(1,K);
        for y = 1:K
            key = [key num2str(y)];
            hash(y) = DJB31MA(key, 127);
        end
        MinHashInt(i,:) = min([MinHashInt(i,:); hash]);  
    end
end

shingle_size = 3;
K = 100; 
MinHashSearch = inf(Nu,K);
B = zeros(8e3, 1, 'uint8');      
bloomFunctions = 6;
for i = 1:Nu
    nome = lower([dic{i,2} ' ' dic{i,3}]);
    B = BloomFilterInsert(bloomFunctions, B, nome);
    shingles = {};
    for j = 1 : length(nome) - shingle_size + 1 
        shingle = nome(j:j + shingle_size - 1);
        shingles{j} = shingle;
    end
    for w = 1:length(shingles)
        key = char(shingles(w));
        hash = zeros(1,K);
        for y = 1:K
            key = [key num2str(y)];
            hash(y) = DJB31MA(key, 127);
        end
        MinHashSearch(i,:) = min([MinHashSearch(i,:);hash]);  
    end
end

K = 100;
MinHashSim = inf(Nu, K);
for i = 1:Nu
    interests = [];
    ind = 5;
    while (ind <= 19 && isa(dic{i, ind}, 'char'))
        interests = [interests string(dic{i, ind})];    
        ind = ind + 1;
    end
    for j = 1:length(interests)
        key = char(interests(j));
        hash = zeros(1,K);
        for y = 1:K
            key = [key num2str(y)];
            hash(y) = DJB31MA(key, 127);
        end
        MinHashSim(i,:) = min([MinHashSim(i,:); hash]); 
    end
end 

save 'data' 'dic' 'Nu' 'users' 'friends' 'MinHashInt' 'B' 'MinHashSearch' 'MinHashSim'

function B = BloomFilterInsert(f, B, elem)
    n = length(B);
    for i = 1:f
        elem = [elem num2str(i)];       
        hcode = hashstring(elem, n);    
        hcode = mod(hcode, n);         
        B(hcode + 1) = 1;                
    end
end