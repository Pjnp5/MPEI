clc; clear;

N = 1e5;
% alphabet = ['a':'z' 'A':'Z'];
% keys = Gera_chave(N, 6, 20, alphabet);
% keys = unique(keys);
alpha = 'a':'z';
probs_file = fopen('prob_pt.txt','r');
format shortE;
formatSpec = '%f';
probs = fscanf(probs_file,formatSpec);
keys = Gera_chave(N, 6, 20, alpha, probs);
keys = unique(keys);
N1 = 5e5;
N2 = 1e6;
N3 = 2e6;

% Hash function 1 --> string2hash(str, djb2)
% djb2 = zeros(1, N1);
% sdbm = zeros(1, N1);
hash_str = zeros(1, N1);
DJ = zeros(1, N1);
colisoes = zeros(3, 2);
for i = 1:N
    hCode_1 = hashstring(keys{i}, N1) + 1; % somar 1, pois retorna como se os índices começassem em 0
    % retorna uma posição para a determinada chave
    hash_str(hCode_1) = hash_str(hCode_1) + 1;

%     hCode_2 = mod(string2hash(keys{i}, djb2), N1) + 1;
%     djb2(hCode_2) = djb2(hCode_2) + 1;
% 
%     hCode_3 = mod(string2hash(keys{i}, sdbm), N1) + 1;
%     sdbm(hCode_3) = sdbm(hCode_3) + 1;

    hCode_4 = mod(DJB31MA(keys{i}, 0), N1) + 1;
    DJ(hCode_4) = DJ(hCode_4) + 1;
end
colisoes(1,:) = [sum(hash_str)-sum(hash_str > 0) sum(DJ)-sum(DJ > 0)];

figure(1);
subplot(3,1,1);
hold on;
histogram(hash_str, 100)
histogram(DJ, 100)
hold off;

hash_str = zeros(1, N2);
DJ = zeros(1, N2);
for i = 1:N
    hCode_1 = hashstring(keys{i}, N2) + 1;
    hash_str(hCode_1) = hash_str(hCode_1) + 1;

    hCode_4 = mod(DJB31MA(keys{i}, 0), N2) + 1;
    DJ(hCode_4) = DJ(hCode_4) + 1;
end
colisoes(2,:) = [sum(hash_str)-sum(hash_str > 0) sum(DJ)-sum(DJ > 0)];

subplot(3,1,2);
hold on;
histogram(hash_str, 100)
histogram(DJ, 100)
hold off;

hash_str = zeros(1, N3);
DJ = zeros(1, N3);
for i = 1:N
    hCode_1 = hashstring(keys{i}, N3) + 1;
    hash_str(hCode_1) = hash_str(hCode_1) + 1;

    hCode_4 = mod(DJB31MA(keys{i}, 0), N3) + 1;
    DJ(hCode_4) = DJ(hCode_4) + 1;
end
colisoes(3,:) = [sum(hash_str)-sum(hash_str > 0) sum(DJ)-sum(DJ > 0)];

subplot(3,1,3);
hold on;
histogram(hash_str, 100)
histogram(DJ, 100)
hold off;
colisoes