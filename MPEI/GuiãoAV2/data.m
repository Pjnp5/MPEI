clear all; clc;
dic = readcell('utilizadores.txt', 'Delimiter', ';');

amigos = load('amigos.txt');
a = amigos(:, 1:2);
clear amigos;
users = unique(a(:, 1));
Nu = length(users);

friends = cell(Nu, 1); % Usa celulas
for n = 1:Nu % Para cada utilizador
    % Obtem os amigos de cada um
    i = find(a(:, 1) == users(n));
    friends{n} = [friends{n} a(i, 2)];
end