%% Ex 1.
clear all;
clf;
close;

%% a)

x = 1:6;          %A variavel aleatoria x pode tomar os valores 1 ate 6 
pX = ones(1,6)/6 %px(1) = P("sair 1") = px(2) = P("sair 2")... = px(6) = P("sair 6) = 1/6 
 
figure(1);
hold on;

subplot(2,2,[1,2]);

stem(x,pX); %dar plot a partir do eixo do x e termina com uma bolinha no topo
axis([0 6.5 0 1/6*1.2]); % dizer as dimensoes que queresmos para o grafico
xlabel('x');
ylabel('pX');
title("Grafico Funcao de massa de probabilidade de X");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% b)

%Fx(x) = prob[X <= x];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This works but there're better ways

%Fx = zeros(1,6);

%for i = 1 : 6
%  for j = 1 : i
%    Fx(i) += 1/6;
%  endfor
%endfor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Fx = cumsum(pX); %criar um vetor que seja [1/6, 2/6, 3/6, 4/6, 5/6, 6/6], o proximo é sempre + x
Fx = [0 0 Fx 0 0];  
x = -1:8;

subplot(2,2,[3,4])

stairs(x,Fx);
axis([0 6.5 0 1.1]);
xlabel('x');
ylabel('FX');
title("Grafico Funcao de distribuicao acumulada de X");

hold off;
