clc; clear;
%% a) 
N = 1e5;
alphabet = ['a':'z' 'A':'Z'];
keysA = gera_Chave(N, 6, 20, alphabet);
keysA = unique(keysA)
length(keysA)

%% b) 
N = 1e5;
alpha = 'a':'z';
probs_file = fopen('prob_pt.txt','r');
format shortE;
formatSpec = '%f';
probs = fscanf(probs_file,formatSpec);
keysB = gera_Chave(N, 6, 20, alpha, probs);
keysB = unique(keysB)