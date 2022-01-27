function B = Inserir(elem, B, k)
% Insere um elemento no filtro de Bloom e devolve o mesmo atualizado
% elem --> elemento a ser inserido
% B    --> filtro de Bloom
% k    --> número de funções
    
    n = length(B);
    
    for i = 1:k
        elem = [elem num2str(i)];       % Convert numbers to character representation
        hcode = hashstring(elem, n);    % Aplicação de uma hashfunction
        hcode = mod(hcode, n);          % Assegurar que o hashCode não excede o tamanho de B
        B(hcode + 1) = 1;               % Mudar o valor de B em hashCode + 1 
                                        % (para garantir que não temos índice 0) para 1
    end
end