A = 1; B = 2; C = 3; D = 4; INT = 5; PONTO = 6; 

H = [0.7 0.2 0 0 0 0; 0.2 0 0.3 0 0 0 ; 0 0.6 0.3 0 0 0 ; 0.1 0.2 0.3 0.1 0 0 ; 0 0 0 0.4 1 0; 0 0  0.1 0.5 0 1];
T = [1;0;0;0;0;0];

rank10 = H^9 * T;
rank10 = H^14 * T;

%% c
Tamanho_string_medio = 0;
for i = 1:100000000
    Estado = [0;0;1;0;0;0];
    estado = String(H, 3, [INT PONTO]);
    Tamanho_string_medio = Tamanho_string_medio + length(estado);
    i = i + 1;
end

Tamanho_string_medio = Tamanho_string_medio/100000000

function estado = String(H, primeiro, ultimo)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     estado = [primeiro];
     % keep moving from state to state until state "last" is reached:
     while (1)
          estado(end+1) = ProximoEstado(H, estado(end));
          if (ismember(estado(end),ultimo))
              break;
          end
     end
end

function estado = ProximoEstado(H, EstadoAtual)
     % find the probabilities of reaching all states starting at the current one:
     probVetor = H(:,EstadoAtual)';  % probVector is a row vector 
     n = length(probVetor);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     estado = randomizar(1:n, probVetor);
end

function Estado = randomizar(estados, probVetor)
     U=rand();
     i = 1 + sum(U > cumsum(probVetor));
     Estado = estados(i);
end