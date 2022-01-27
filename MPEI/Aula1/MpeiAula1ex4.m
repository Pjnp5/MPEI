%%Ex4

function probabilidade = MpeiAula1ex4(p, n_lances, n_caras, n_experiencias)
    lancamentos = rand(n_lances,n_experiencias) > p;
    sucessos= sum(lancamentos)==n_caras;
    probabilidade = sum(sucessos)/n_experiencias;
end

%para correr a função devemos usá-la noutra file ou cmd
