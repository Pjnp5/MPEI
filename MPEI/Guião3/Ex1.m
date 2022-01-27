matriz = [0.2,0.3;0.8,0.7];
Estados = ["F", "P"];
VP = [0;1];
VF = [1;0];
%% a)
% P(de estar na quarta e se esteve na anterior)

V2 = (matriz^2)*VP; %multiplicamos a matriz por 2 porque são 2 transiçoes
fprintf("Prob de faltar: %3.3f \nProb de estar presente: %3.3f\n", V2(1,1), V2(2,1));

%% b)
%   P(de não estar na quarta e se esteve na anterior)

V2 = (matriz^2)*VF; %multiplicamos a matriz por 2 porque são 2 transiçoes
fprintf("Prob de faltar: %3.3f \nProb de estar presente: %3.3f\n", V2(1,1), V2(2,1));

%% c)
%P(Estar na ultima aula sabendo que esteve na 1ª aula e
% o semestre tem 15 semanas)
V29 = (matriz^29)*VP;
fprintf("Prob de faltar: %3.4f \nProb de estar presente: %3.4f\n", V29(1,1), V29(2,1));

%% d)
%P(Faltar a cada aula nas 15 semanas, sabendo que tem 85%
% de possibilidade de ir á primeira)
A1 = [0.15;0.85];
nAulas =30;
A = zeros(nAulas,1);
A(1) = 0.15;
for i = 1 : (nAulas - 1)
   Vi = (matriz^i)*A1;
   A(i+1) = Vi(1);
end
plot([0:nAulas-1],A);
