%% b)
C = 1; A = 2; O = 3; S = 4; FIM = 5;

T = [0   1/3 1/3 0   0
     1/2 0   0   1/3 0
     1/2 0   0   1/3 0
     0   1/3 1/3 0   0
     0   1/3 1/3 1/3 1];
%% c)
% how to use crawl()
letras = 'CAOS';

escolha = randi(4);
state = crawl(T, escolha, FIM);
letras(state)
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state

%% e)
n = 10^5;
Palavras = {};
nr_Palavras = {};

for i = 1:n
    state = crawl(T, escolha, FIM);
    for k = 1:i
        tamanho = length(Palavras) + 1;
        if size(Palavras) == 0
            palavra = letras(state);
            Palavras{1,tamanho} = palavra;
            nr_Palavras{1,tamanho} = 1;
            break;
        end
        Palavras{1,k}
        if length(Palavras{1,k}) == length(letras(state))
            if Palavras{1,k} == letras(state)
                nr_Palavras{1,k} = nr_Palavras{1,k} + 1;
                break;
            else
                Palavras{1,tamanho + 1} = letras(state);
                nr_Palavras{1,length(nr_Palavras) + 1} = 1;
            end
        end
    end
end
function state = crawl(T, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          nt = nextState(T, state(end));
          if (nt == last)
              break;
          end
          state(end+1) = nt;
     end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector 
function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end
