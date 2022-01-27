clc;
clear all;

load utilizadores.txt
; %'dic' 'Nu' 'users' 'Set' 'MinHashValue' 'MinHashSig'
users
user = 0;
option = 0;

menu(user, option, Nu, Set, dic, MinHashValue, MinHashSig);

function menu(utilizador, opcao, Nu, Set, dic, MinHashValue, MinHashSig)
    while(isempty(option) || option < 4 || user == 0)
        clc
        if (user == 0)
            user = str2num(input(['Insert User ID (1 to ' num2str(Nu) '): '], 's'));
        elseif (isempty(user) || user< 1 || user>Nu)
            fprintf(2, 'User ID not valid.');
            fprintf(2, '\nPress any key to continue. ');
            pause; clc;  % Manter a informação disponível até ao utilizador pressionar em qualquer tecla
            user = 0;
        else
            fprintf('\nUser ID: %d\nMenu', utilizador);
            fprintf('\n1 - Your Movies\n2 - Get Suggestions\n3 - Search Title\n4 - Exit\nSelect choice: ');
            option = str2num(input('', 's'));
            if isempty(option)
                continue;
            end
            
            switch option
                case 1
                    YourFriends(user, Set, dic);
                case 2
                    Interests(Nu, MinHashValue, user, Set, dic);
                case 3
                    searchName(dic, MinHashSig)
                case 4
                    FindMostSimilarUser()
                case 5
                    clc
                    break;
                otherwise
                    option = 0;
                    clc
            end
        end
    end
end