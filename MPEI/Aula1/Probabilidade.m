%% Codigo 2- ca´lculo analı´tico de probabilidade em se´ries experieˆncias de Bernoulli
% Dados relativos ao problema 1

function prob = Probabilidade(p, n_caras, n_lances)

prob = nchoosek(n_lances,n_caras)*p^n_caras*(1-p)^(n_lances-n_caras); % nchoosek(n,k)= n!/(n-k)!/k!

end

%% n_lances -> n; n_caras -> k