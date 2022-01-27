%Ex 3.
clear all;
clf;
close;

%X = numero de coroas observadas em 4 lancamentos de uma moeda equilibrada

%% a)

%Sx = {0, 1, 2, 3, 4}
pX = zeros(1, 5);

N = 1e5; %Numero de experiencias
p = 0.5; %Probabilidade de sair coroa
n = 4;   %numero de lancamentos por experiencia

for i=1 : 5
  k = i-1;
  pX(i) = fMassaProb(N,p,k,n);
end
%pX

figure(1);
hold on;

subplot(2,2,[1,2]);

x = 0:4;
stem(x,pX);

axis([-0.5 4.5 0 0.5]);
xlabel('x');
ylabel('pX');
title("Grafico Funcao de Probabilidade de X (Simulado)");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("b)");

%% b)

%Valor esperado = somatorio de i=0 ate m de xi * P(X = xi)
E = 0;
for i=1 : 5
  E = E + (i-1) * pX(i);
end


printf("E[X]: %d\n",E);

%Variancia = E[X^2] - E^2[X]
E2 = 0;
for i=1 : 5
  E2 = E2 + (i-1)^2 * pX(i);
end

var = E2 - E^2;

printf("Var(X)= %d\n",var);

%Desvio padrao = sqrt(var(X))
dp = sqrt(var);
printf("σX = %d\n",dp);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% c)

% Esta variavel aleatoria apresenta o comportamento de uma Distribuicao Binomial
%visto que basicamente, temos 4 repeticoes de uma experiencia de Bernoulli (no 
%lancamento de uma moeda, podemos encarar que temos sucesso quando calha coroa
%e insucesso quando calha cara)

%Teoricamente, a expressao da Funcao de massa de prob. de uma variavel Binomial e:

%pX(k) = nCk * p^k * (1-p)^(n-k) = n! / (k! * (n-k)!) * p^k * (1-p)^(n-k)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% d)

pXTeorica = zeros(1,5);
n = 4;
p = 1/2;

for i=1 : 5
  k = i-1;
  nCk = factorial(n)/(factorial(k) * factorial(n-k));
  pXTeorica(i) = nCk * p^k * (1-p)^(n-k);
end

subplot(2,2,[3,4]);
x = 0:4;
stem(x,pXTeorica);

axis([-0.5 4.5 0 0.5]);
xlabel('x');
ylabel('pX');
title("Grafico Funcao de Probabilidade de X (Teorico)");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("\ne)");

%% e)

%i)
p = sum(pXTeorica(x>=2));
printf("P(Pelo menos 2 coroas): %d\n",p);

%ii)
p = sum(pXTeorica(x<=1));
printf("P(Ate 1 coroa): %d\n",p);

%iii)
p = sum(pXTeorica(x>=1 & x<=3));
printf("P(Entre 1 e 3 coroas): %d\n",p);