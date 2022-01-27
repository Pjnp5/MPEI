function chaves = Gera_chave(N, imin, imax, c, p)
% N    --> número de chaves a gerar
% imin --> comprimento mínimo da chave
% imax --> comprimento máximo da chave
% c    --> vetor com os caracteres a utilizar
% p    --> vetor com a probabilidade de cada caracter
    if nargin < 5
       p = 1/length(c)*ones(1,length(c)); % ser equiprovavel
    end

    l = randi([imin, imax], 1, N); 
    chaves = cell(N, 1);

    for chave = 1:N
        chaves{chave} = '';
        for r = 1:l(chave)
            prob = rand();
            i = 1 + sum(prob > cumsum(p));
            chaves{chave} = [chaves{chave} c(i)];
        end
%         l = randi([imin, imax], 1);
%         v = randi(length(c), 1, l);     % escolha aleatória dos caracteres de c que pertecem à chave
%         chaves(chave, 1) = {c(v)};
    end
end
