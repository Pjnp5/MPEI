clc;
clear all;

load data;

user = 0;
option = 0;
Nu = 1000;

while(isempty(option) || option < 5 || user == 0)
    clc;
    if (user == 0)
        user = str2num(input(['Insert User ID (1 to ' num2str(Nu) '): '], 's'));        
    elseif (isempty(user) || user< 1 || user>Nu)
        fprintf(2, 'User ID not valid.');
        fprintf(2, '\nPress any key to use another ID. ');
        pause; clc;  % Manter a informação disponível até ao utilizador pressionar uma tecla
        user = 0;
    else
        fprintf('\nUser ID: %d\nMenu', user);
        fprintf('\n1 - Your Friends\n2 - Interests from most similar user\n3 - Search Name\n4 - Find most similar users based in list of interests \n5 - Exit\nSelect choice: ');
        option = str2num(input('', 's'));
        if isempty(option)
            continue;
        end 
        switch option
                case 1
                    YourFriends(user, friends, dic);
        %%        case 2
        %%            Interests();
                case 3
                    searchName(dic,);
        %%        case 4
        %%            FindMostSimilarUser();
                case 5
                    clc
                    break
                otherwise
                    option = 0;
                    clc
        end
    end
end

function YourFriends(user, friends, dic)
    fprintf('\nYour  friends:\n');
    for i = 1:length(friends{user})
        fprintf('%d - %s %s\n', dic{friends{user}(i),1}, dic{friends{user}(i),2}, dic{friends{user}(i),3});
    end
    fprintf(2, 'Press key to continue. ');
    pause; clc;  % Manter a informação disponível até ao utilizador pressionar em qualquer tecla
end


function searchName(dic, MinHashSig)
    str = lower(input('\nNome a pesquisar: ', 's'));
    shingle_size = 3;  % Utilizar o mesmo numero de shingles que na database
    K = size(MinHashSig, 2);  % Usar o K igual ao K utilizado na base de dados para os shingles dos titulos
    threshold = 0.99;  % Definir um threshold que nos é dado

    % Cell array com os shingles da string introduzida
    shinglesAns = {};
    for i = 1:length(str) - shingle_size+1
        shingle = str(i:i+shingle_size-1);
        shinglesAns{i} = shingle;
    end

    % Fazer a MinHash dos shingles da string introduzida
    MinHashString = inf(1,K);
    for j = 1:length(shinglesAns)
        chave = char(shinglesAns{j});
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashString(1,:) = min([MinHashString(1,:); hash]);
    end

    % Distancia de Jaccard entre a string e cada pessoa
    distJ = ones(1, size(dic,1));  % array para guardar distancias
    h = waitbar(0,'Calculating');
    for i=1:size(dic, 1)  % cada hashcode da string
        waitbar(i/K, h);
        distJ(i) = sum(MinHashSig(i,:) ~= MinHashString)/K;
    end
    delete(h);
    
    ctrl = false;  % controlo para saber se houve algum nome encontrado com uma distancia menor ou igual a threshold
    for i = 1:5
        [val, pos] = min(distJ);  % Calcular o valor minimo (mais similaridade)
        if (val <= threshold)  % Se o valor minimo já nao pretencer ao threshold não dá print
            ctrl = true;
            fprintf('%s   (%f)\n', dic{pos, 1}, val);
        end
        distJ(pos) = 1;  % Retirar esse filme dando uma distancia igual a 1
    end
    
    if (~ctrl)
        fprintf('No names found.\n');
    end
    fprintf(2, 'Press any key to continue. ');
    pause;clc;  % Manter a informação disponível até ao utilizador pressionar em qualquer tecla  
end
    
