clc;
clear all;

utilizadores = fopen("utilizadores.txt");

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
        fprintf('\n1 - Your Friends\n2 - Interests from most similar user\n3 - Search Name\n4 - Find most similar users based in list of interests \n5 - Exit\nSelect choice: ');
        option = str2num(input('', 's'));
        if isempty(option)
            continue;
        end    
        switch option
                case 1
                    YourFriends();
                case 2
                    Interests();
                case 3
                    searchName()
                case 4
                    FindMostSimilarUser()
                case 5
                    clc
                    break
         end
    end
end
