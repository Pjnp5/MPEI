clc;
clear all;

load data;

user = 0;
option = 0;
Nu = 1000;

while(isempty(option) || option < 5 || user == 0)
    %clc;
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
            case 2
                Interests(Nu, MinHashInt, user, dic);
            case 3
                SearchName(Nu, dic, MinHashSearch);
        %        case 4
        %            FindMostSimilarUser();
            case 5
                clc;
                break;
            otherwise
                option = 0;
                clc;
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

function Interests(Nu, MinHashInt, user, dic)                    
    K = 100;  % Usamos o mesmo número de funcoes de dispersão usados para a MinHash na database
    J = ones(1, Nu); % array para guardar distâncias
    h = waitbar(0, 'Calculating');
    for n = 1:Nu
        waitbar(n/Nu, h);
        if n ~= user
            J(n) = 1 - sum(MinHashInt(n,:) == MinHashInt(user,:))/K;  % Calculamos a distancia de Jaccard para todos os pares possiveis desse user
        end
    end
    delete(h);
    [val, SimilarUserId] = min(J);

    UserInterests = [];
    i = 5;
    while isa(dic{user, i}, 'char')
        UserInterests = [UserInterests string(dic{user, i})];
        i = i + 1;
    end

    fprintf('\nYour most similar user is:\n%d - %s %s\n', dic{SimilarUserId,1}, dic{SimilarUserId,2}, dic{SimilarUserId,3});
    fprintf('\nAnd his/her interests are:\n');
    SimilarUserInterests = [];
    ind = 5;
    while isa(dic{SimilarUserId, ind}, 'char')
        SimilarUserInterests = [SimilarUserInterests string(dic{SimilarUserId, ind})];
        fprintf('%s\n', dic{SimilarUserId, ind});
        ind = ind + 1;  
    end

    Suggestions = setdiff(SimilarUserInterests, UserInterests);
    
    if isempty(Suggestions)  % Se nao houver sugestoes
        fprintf('\nThere are no new suggestions.\n');
    else
       fprintf('\nSuggestions for you:\n');
       for i = 1:length(Suggestions)  % Display dos filmes sugeridos
           fprintf('%s\n', Suggestions(i));
       end
    end
    fprintf(2, 'Press any key to continue. ');
    pause;clc;
end

function SearchName(Nu, dic, MinHashSearch)
    search = lower(input('\nWrite a string: ', 's'));
    shingle_size = 4;  % Utilizar o mesmo numero de shingles que na database
    K = 150;  % Usar o K igual ao K utilizado na base de dados para os shingles
    threshold = 0.8;  % Definir um threshold que nos é dado

    % Cell array com os shingles da string introduzida
    shinglesAns = {};
    for i = 1:length(search) - shingle_size + 1
        shingle = search(i:i + shingle_size - 1);
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
    J = ones(1, Nu);  % array para guardar distancias
    SimilarNames = {};
    JaccardDistances = {};
    k = 0;
    h = waitbar(0,'Calculating');
    for i = 1:Nu  % cada hashcode da string
        waitbar(i/K, h);
        J(i) = 1 - sum(MinHashSearch(i,:) == MinHashString)/K;
        if (J(i) <= threshold)
            k = k + 1;  % número de nomes obtidos
            SimilarNames{k} = [dic{i,2} ' ' dic{i,3}];
            JaccardDistances{k} = J(i);
        end
    end
    delete(h);

    JaccardDistances = cell2mat(JaccardDistances);
    [JaccardDistances, index] = sort(JaccardDistances);

    if (k == 0)
        fprintf('\nNo results found.\n');
    else 
        for h = 1 : 7
            fprintf('%s - %.3f\n', SimilarNames{index(h)}, JaccardDistances(h));
        end
    end
    fprintf(2, 'Press any key to continue. ');
    pause;clc;  % Manter a informação disponível até ao utilizador pressionar em qualquer tecla  
end
    
