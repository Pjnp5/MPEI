%% a)
%Matriz transição de trocas entre grupos
matriz = [1/3, 1/4, 0;1/3,11/20,1/2;1/3,1/5,1/2];
nAlunos = 90;
nAulas = 30;
 
%% b)
%Crie o vector relativo ao estado inicial 
% considerando que no total temos 90 alunos, o grupo A tem
%o dobro da soma dos outros dois e os grupos B e C tem o mesmo
% numero de alunos.

A0 = [60;15;15]/nAlunos;

%% c)
%Quantos elementos integrarao cada grupo no fim da aula 30 
%considerando como estado inicial o ˜
%definido na al´ınea anterior?

V30 = (matriz^30)*A0 * 90 % porque há 30 aulas, ou seja, 30 transiçoes, visto que a transiçao ocorre no fim de cada aula
fprintf("A) %3.0f\nB) %3.0f\nC) %3.0f\n",V30(1,1),V30(2,1),V30(3,1));
%% d)
%Quantos elementos integrarao cada grupo no fim da aula 30
%considerando que inicialmente se dis- ˜
%tribuiram os 90 alunos equitativamente pelos 3 grupos?


A0 = [30;30;30]/nAlunos;
A = zeros(nAulas, 1);
B = zeros(nAulas, 1);
C = zeros(nAulas, 1);
A(1) = A0(1)*nAlunos;
B(1) = A0(2)*nAlunos;
C(1) = A0(3)*nAlunos;
for i = 1 : (nAulas)
   Vi = (matriz^i)*A0*90;
   A(i+1) = Vi(1);
   B(i+1) = Vi(2);
   C(i+1) = Vi(3);
end
hold on
plot(0:nAulas,A, "b");
plot(0:nAulas,B, "g");
plot(0:nAulas,C, "r");
