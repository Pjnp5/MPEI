clc; clear;

N = 1e5;
alphabet = ['a':'z' 'A':'Z'];
keys = gera_Chave(N, 6, 20, alphabet);
keys = unique(keys);
N1 = 5e5;
N2 = 1e6;
N3 = 2e6;

% Hash function 1 --> string2hash(str, djb2)
countN1_djb2 = zeros(3, N1);   % número de atribuições a cada uma das posições
djb2 = zeros(3, N);            % vetor com os hashcodes obtidos
for i = 1:N
    key = keys{i};
    hCode = mod(string2hash(key, djb2), N1) + 1;
    djb2{1, i} = hCode;
    count1_N1(hCode) = count1_N1(hCode) + 1;
end

% Hash function 2 --> string2hash(str, sdbm)
% Hash function 3 --> hashstring()
% Hash function 4 --> DJB31MA()


 

figure(1);
histogram(hCode, 100)