%% a
H = [0.01 0.07 0.02; 0.04 0 0.08; 0.04 0.15 0.09; 0.01 0.20 0.01];
Beta = 1 - sum(H(:))

%% b
H_com_Beta = [0.01 0.07 0.02; 0.04 0.28 0.08; 0.04 0.15 0.09; 0.01 0.20 0.01];
for i = 1:4
    Prob_X(i) = sum(H_com_Beta(i,:));
    if (i ~= 4)
        Prob_Y(i) = sum(H_com_Beta(:,i));
    end
end
fprintf("Probabilidades de X\n1 - %f\n2 - %f\n3 - %f\n4 - %f\n",Prob_X(1),Prob_X(2),Prob_X(3),Prob_X(4));
fprintf("Probabilidades de Y\n1 - %f\n2 - %f\n3 - %f\n",Prob_Y(1),Prob_Y(2),Prob_Y(3));
%% c
Media_X = 0; Media_Y = 0; Media_X2 = 0; Media_Y2 = 0; X = [1 2 3 4]; Y = [0 2 3];
for i = 1:4
    Media_X = Media_X + Prob_X(i) * X(i);
    Media_X2 = Media_X2 + Prob_X(i) * X(i)^2;
    if (i ~= 4)
        Media_Y = Media_Y + Prob_Y(i) * Y(i);
        Media_Y2 = Media_Y2 + Prob_Y(i) * Y(i)^2;
    end
end

Var_X = Media_X2 - Media_X^2 % calculo da variancia
Var_Y = Media_Y2 - Media_Y^2 % calculo da variancia

%% d
  Controlo = 1;
  for i = 1 : 4
    for j = 1 : 3
      if(abs(T(i,j)-(pX(i)*pY(j)))>1e-5) % se o valor de (T - Px * Py) para algum dos valores da matriz
        Controlo=0;                           % for maior que 1e-5 então não são independentes
        break;
      end 
    end  
    if(Controlo==0)
      break;
    end  
  end 
  if (Controlo == 1)
    fprintf("São independentes\n");
  else
    fprintf("Não são independentes\n");
  end

  %% e
  Correlacao=0;
  for m = 1 : length(X)
    for n = 1 : length(Y)
      Correlacao = Correlacao + X(m)*Y(n)*T(m,n); 
    end
  end
  
  %Corr = E[XY] = sum(sum(p(X=x,Y=y)*X(x)*Y(y)))
  Correlacao
  %covariancia = Corr - E[X]*E[Y]
  Covariancia = Correlacao - Media_X*Media_Y    
  %coefCorrelacao = Cov / DesvioPadrao(X)*DesvioPadrao(Y) = Cov/sqrt(Var(X)*Var(Y))
  Coeficiente_de_Correlacao = Covariancia/sqrt(var(X)*var(Y))
  