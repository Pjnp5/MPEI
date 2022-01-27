clear all;
clf;
close;

%X -> variavel aleatoria continua com distribuicao normal
%X = classificacoes dos alunos de um determinado curso

%media = 14;
%desvio padrao = 2;

N = 1e5;
dp = 2;
m = 14;

classificacoes = dp.*randn(1,N) + m;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% a)

sucessos = (12<classificacoes & classificacoes<16);
pSim = sum(sucessos)/N;


% z = (X-m)/dp

%12 - 14  / 2 = -2/2;
%16 - 14  / 2 = 2/2;
% P[12<X<16] = P[-2/2 < Z < 2/2] = P[-1 < z < 1] = Fi(1) - Fi(-1) = 1-Q(1) - 1 + Q(-1) = Q(-1) - Q(1) = 1-Q(1) - Q(1) = 1 - 2Q(1) = 1 - 2*1.587
pTeorico = 1 - 2 * 0.1587;

%fprintf("\nTeorico:\n P(Aluno ter classificacao entre 12 e 16) = %f\n",pTeorico);
fprintf("Simulado:\n P(Aluno ter classificacao entre 12 e 16) = %f\n",pSim);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% b)

sucessos = (10<classificacoes & classificacoes<18);
pSim = sum(sucessos)/N;


% z = (X-m)/dp

%10 - 14  / 2 = -4/2;
%18 - 14  / 2 = 4/2;
% P[12<X<16] = P[-4/2 < Z < 4/2] = P[-2 < z < 2] = Fi(2) - Fi(-2) = 1-Q(2) - 1 + Q(-2) = Q(-2) - Q(2) = 1-Q(2) - Q(2) = 1 - 2Q(2) = 1 - 2*0.2275e-1
pTeorico = 1 - 2*0.2275*10^-1;


%fprintf("\nTeorico:\n P(Aluno ter classificacao entre 10 e 18) = %f\n",pTeorico);
fprintf("Simulado:\n P(Aluno ter classificacao entre 10 e 18) = %f\n",pSim);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% c)

sucessos = (classificacoes>=10);
pSim = sum(sucessos)/N;

% z = (X-m)/dp

%10 - 14  / 2 = -4/2;
%20 - 14  / 2 = 6/2;
% P[10<X<20] = P[-4/2 < Z < 6/2] = P[-2 < z < 3] = Fi(3) - Fi(-2) = 1-Q(3) - 1 + Q(-2) = Q(-2) - Q(3) = 1-Q(2) - Q(3) = 1 - 0.2275e-1 - 0.1350e-2
pTeorico = 1 - 0.2275*10^-1 - 0.1350*10^-2;

%fprintf("\nTeorico:\n P(Aluno ter classificacao maior ou igual que 10) = %f\n",pTeorico);
fprintf("Simulado:\n P(Aluno ter classificacao maior ou igual que 10) = %f\n",pSim);