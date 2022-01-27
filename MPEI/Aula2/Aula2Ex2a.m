%Ex 4.

n = 20;   %20 dardos
m = 100; %100 alvos
N = 1e5;
%Em cada lancamento e atingido um alvo e apenas 1 em 100

%a)
%a)
disp("A)")
N = 1e5;
n = 20;
m = 100;

lancam = randi(m, n,N);
succe = 0;

for j = 1:N
    if length(unique(lancam(:,j))) == n
        succe = succe + 1;
    end
end

probA = succe/N


%b)
fprintf("B)");

probB = 1-probA

%c)
fprintf("C)");

figure(1);
n = 1:5:100;
m = [1e3 1e4 1e5 1e6];
N = 1e3;

for g=1:4
  subplot(2,2,g);
  probs = 0*n;
  for i=1:length(n)
    probs(i) =  1-alvoCalc(n(i),N,m(g));
  end
  
  plot(n(1:i),probs(1:i),"r.");
  xlabel('n');
  ylabel('prob');
  title(["m=" num2str(m(g))]);
end
