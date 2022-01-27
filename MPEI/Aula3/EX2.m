%% Ex 2.
clear all;
clf;
close;
%% a)
%#Total de notas = 90 + 9 + 1 = 100 notas

%O espaco de amostragem da experiencia "Retirar uma nota da caixa" e:
%   S = {nota 1, nota 2, nota 3, ... , nota 100}

%Como cada nota tem a mesma probabilidade de ser retirada, os acontecimentos equiprovaveis sao elementares:
% p("retirar nota 1") = p("retirar nota 2") = ... = p("retirar nota 100") = casos favoraveis / casos possiveis = 1/100


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% b)

% X = Valor da nota retirada a sorte da caixa que contem 90 notas de 5, 9 notas de 50 e 1 nota de 100

%Espaco de amostragem de X:
%Sx = {5, 50, 100}

%Funcao massa de probabilidade de X:

%pX(x) = P("Sair nota com valor x")

%pX(5) = P("Sair nota com valor 5") = 90/100;
%pX(50) = P("Sair nota com valor 50") = 9/100;
%pX(100) = P("Sair nota com valor 100") = 1/100;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% c)


px = zeros(1,3);
x = [5 50 100];


% colocar a probalidade
px(1) = 90/100;
px(2) = 9/100;
px(3) = 1/100;

figure(1);

stem(x,px);
axis([0 101 0 1]);
xlabel('x');
ylabel('pX');
title("Grafico Funcao de massa de probabilidade de X");