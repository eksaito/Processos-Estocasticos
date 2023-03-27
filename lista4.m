%% Lista 4
% Resolução da lista de exercícios
% Lista 4
% Data: 04/09/2020
% Data de entrega: 09/09/2020
%% Exercicio 18
% Constantes
n = 1000;
kloop = 10000; 
A = zeros(1,n);
vari = zeros(1,n);
%% Média temporal
for nloop = 10:n
    x = randn(1,nloop);
    A(nloop) = sum(x)/(nloop+1);
end

figure(1)
plot(A)
title('Média temporal')
xlabel('Valores de N')
%% Variância da média tempora
for nloop = 10:n
    for ind = 1:kloop
        x = randn(1,nloop);
        A(ind) = sum(x)/(nloop+1);
    end
    vari(nloop) = sum((A-mean(A)).^2)/kloop;
end
%%
figure(2)
plot(vari)
title('Variância da média temporal')
xlabel('Valores de N')