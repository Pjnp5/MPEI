clc;
clear all;

load data;

user = 0;
option = 0;

menu(user, option, Nu, dic, friends, MinHashInt, MinHashSearch, B, MinHashSim);

function menu(user, option, Nu, dic, friends, MinHashInt, MinHashSearch, B, MinHashSim)
    while(isempty(option) || option < 5 || user == 0)
        clc;
        if (user == 0)
            user = str2num(input(['Insert User ID (1 to ' num2str(Nu) '): '], 's'));        
        elseif (isempty(user) || user <  1 || user > Nu)
            fprintf(2, 'User ID not valid.');
            fprintf(2, '\nPress any key to use another ID. ');
            pause; clc;  
            user = 0;
        else
            fprintf('\nUser ID: %d\nMenu', user);
            fprintf(['\n1 - Your Friends\n2 - Interests from most similar user\n3 - Search Name\n' ...
                '4 - Find most similar users based in list of interests \n5 - Exit\nSelect choice: ']);
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
                    SearchName(Nu, dic, MinHashSearch, B);
                case 4
                    FindMostSimilarUser(Nu, user, friends, dic, MinHashSim);
                case 5
                    clc;
                    break;
                otherwise
                    option = 0;
                    clc;
            end
        end
    end
end


function YourFriends(user, friends, dic)
    fprintf('\nYour  friends:\n');
    for i = 1:length(friends{user})
        fprintf('%4d - %s %s\n', dic{friends{user}(i),1}, dic{friends{user}(i),2}, dic{friends{user}(i),3});
    end
    fprintf(2, 'Press key to continue. ');
    pause; clc;
end

function Interests(Nu, MinHashInt, user, dic)                    
    K = 100;
    J = ones(1, Nu);
    h = waitbar(0, 'Calculating');
    for n = 1:Nu
        waitbar(n/Nu, h);
        if n ~= user
            J(n) = 1 - sum(MinHashInt(n,:) == MinHashInt(user,:))/K;
        end
    end
    delete(h);
    [val, SimilarUserId] = min(J);

    UserInterests = [];
    i = 5;
    while (i <= 19 && isa(dic{user, i}, 'char'))
        UserInterests = [UserInterests string(dic{user, i})];
        i = i + 1;
    end

    fprintf('\nYour most similar user is:\n%d - %s %s\n', dic{SimilarUserId,1}, dic{SimilarUserId,2}, dic{SimilarUserId,3});
    fprintf('\nAnd his/her interests are:\n');
    SimilarUserInterests = [];
    ind = 5;
    while (ind <= 19 && isa(dic{SimilarUserId, ind}, 'char'))
        SimilarUserInterests = [SimilarUserInterests string(dic{SimilarUserId, ind})];
        fprintf('%s\n', dic{SimilarUserId, ind});
        ind = ind + 1;  
    end

    Suggestions = setdiff(SimilarUserInterests, UserInterests);
    
    if isempty(Suggestions) 
        fprintf('\nThere are no new suggestions.\n');
    else
       fprintf('\nSuggestions for you:\n');
       for i = 1:length(Suggestions)
           fprintf('%s\n', Suggestions(i));
       end
    end
    fprintf(2, 'Press any key to continue. ');
    pause;clc;
end

function SearchName(Nu, dic, MinHashSearch, B)
    search = lower(input('\nWrite a string: ', 's'));
    f = 6;
    % Verificar se o input está no filtro de bloom
    if BloomFilterVerify(search, B, f)
        fprintf('\nThe inserted string is very likely to correspond to a user name.\n');
    end
    shingle_size = 3;
    K = 100; 
    threshold = 0.8;
    % Cell array com os shingles do input
    shinglesAns = {};
    for i = 1:length(search) - shingle_size + 1
        shingle = search(i:i + shingle_size - 1);
        shinglesAns{i} = shingle;
    end
    % MinHash dos shingles do input
    MinHashString = inf(1,K);
    for j = 1:length(shinglesAns)
        chave = char(shinglesAns{j});
        hash = zeros(1,K);
        for y = 1:K
            chave = [chave num2str(y)];
            hash(y) = DJB31MA(chave, 127);
        end
        MinHashString(1,:) = min([MinHashString(1,:); hash]);
    end
    % Distancia de Jaccard
    J = ones(1, Nu);
    SimilarNames = {};
    JaccardDistances = {};
    w = 0;
    h = waitbar(0,'Calculating');
    for i = 1:Nu  % cada hashcode da string
        waitbar(i/K, h);
        J(i) = 1 - sum(MinHashSearch(i,:) == MinHashString(1,:))/K;
        if (J(i) <= threshold)
            w = w + 1;  % número de nomes obtidos
            SimilarNames{w} = [dic{i,2} ' ' dic{i,3}];
            JaccardDistances{w} = J(i);
        end
    end
    delete(h);
    JaccardDistances = cell2mat(JaccardDistances);
    [JaccardDistances, index] = sort(JaccardDistances);
    if (w == 0)
        fprintf('\nNo results found.\n');
    else 
        for h = 1 : w
            fprintf('%s - %.3f\n', SimilarNames{index(h)}, JaccardDistances(h));
        end
    end
    fprintf(2, 'Press any key to continue. ');
    pause;clc; 
end

function FindMostSimilarUser(Nu, user, friends, dic, MinHashSim)
    fprintf('\n');
    for i = 1:length(friends{user})
        fprintf('%4d - %s %s\n', dic{friends{user}(i),1}, dic{friends{user}(i),2}, dic{friends{user}(i),3});
    end
    Id = str2double(input('\nSelect one of your friends: ', 's'));

    K = 100;  
    J = ones(1, Nu); 
    h = waitbar(0, 'Calculating');
    for n = 1:Nu
        waitbar(n/Nu, h);
        if n ~= Id
            J(n) = 1 - sum(MinHashSim(n,:) == MinHashSim(Id,:))/K;
        end
    end
    delete(h);
    for m = 1:3
        [val, SimilarId] = min(J);
        fprintf('%4d - %s %s\n', dic{SimilarId, 1}, dic{SimilarId, 2}, dic{SimilarId, 3});
        J(SimilarId) = 1;
    end 
    fprintf(2, 'Press any key to continue. ');
    pause;clc;
end

function p = BloomFilterVerify(elem, B, f)
    n = length(B);
    
    for i = 1:f
        elem = [elem num2str(i)]; 
        hcode = hashstring(elem, n);
        hcode = mod(hcode, n);
        p = 1;
        if B(hcode + 1) ~= 1
            p = 0;
        end
    end
end 