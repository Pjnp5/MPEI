%% alínea (a)
%Usando a matriz H das hyperligacoes, obtenha a estimativa
% do pagerank de cada pagina ao fim de 10 iteracoes. Relembre
% que deve considerar (i) a mesma probabilidade de transiçao
% de cada pagina para todas as paginas seguintes possıveis
% e (ii) a probabilidade da pagina inicial deve ser igual
% para todas as paginas. Qual/quais a(s) pagina(s)
% com maior pagerank e qual o seu valor?

   %a b c d e f
H =[0 1 0 0 0 0
    0 0 1/2 0 1/2 0
    0 0 0 1 0 0
    0 0 1 0 0 0
    1/3 1/3 0 0 0 1/3
    0 0 0 0 0 0]';
r = ones(6,1).*1/6;
for i=1:10
    r = H*r;
end
r
% a página com maior pagerank é a C, tal que P(C)=0.3315

%% alínea (b)
%Identifique a ”spider trap”e o ”dead-end”contidos neste
% conjunto de paginas

% spider trap: C+D
% dead-end: F

%% alínea (c)
% Altere a matriz H para resolver apenas o problema do
% "dead-end”e recalcule o pagerank de cada pagina novamente
% em 10 iteracoes

H2 = H;
H2(:,6) = ones(6,1).*1/6;
r = ones(6,1).*1/6;
for i=1:10
    r = H2*r;
end
r

%% alínea (d)
%Resolva agora ambos os problemas e recalcule o pagerank 
% de cada pagina novamente em 10 iteracoes (assuma β = 0, 8).

B = 0.8;
N = ones(6,6).*1/6;
H3 = B.*H + (1-B).*N;
r = ones(6,1).*1/6;
for i=1:10
    r = H3*r;
end
r

%% alínea (e)
%Calcule agora o pagerank de cada pagina considerando um
% numero mınimo de iteracoes que garanta que nenhum valor
% muda mais do que 10−4 em 2 iteracoes consecutivas.
% Quantos iteracoes sao necessarias? Compare os valores de
% pagerank obtidos com os da alınea anterior. O que conclui?

H4 = B.*H + (1-B).*N;
r = ones(6,1).*1/6;
i = ones(6,1);
counter = 0;
while sum(i)>6*(10e-4)
    i = r;
    r = H4*r;
    i = abs(r - i);
    counter = counter + 1;
end
r
counter