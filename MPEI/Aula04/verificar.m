function fp = verificar(elem, B, k, fp)
% Verifica se o elemento pertence ao filtro de Bloom
% elem --> elemento a ser verificado
% B    --> filtro de Bloom
% k    --> número de funções
% fp   --> serve para verificar se há falso positivo ou não

    n = length(B);
    
    for i = 1:k
        elem = [elem num2str(i)]; 
        hcode = hashstring(elem, n);
        hcode = mod(hcode, n);
        if B(hcode + 1) ~= 1
            %fprintf("O elemento não pertence"); % ver como se faz format
            fp = 0;
            return
        end
        fp = 1;
    end