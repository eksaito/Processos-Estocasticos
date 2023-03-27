%% Lista 4
% Resolu��o da lista de exerc�cios
% Lista 4
% Data: 04/09/2020
% Data de entrega: 09/09/2020
%% Exercicio 18
% Constantes
n = 1000;
kloop = 10000; 
A = zeros(1,n);
vari = zeros(1,n);
%% M�dia temporal
for nloop = 10:n
    x = randn(1,nloop);
    A(nloop) = sum(x)/(nloop+1);
end

figure(1)
plot(A)
title('M�dia temporal')
xlabel('Valores de N')
%% Vari�ncia da m�dia tempora
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
title('Vari�ncia da m�dia temporal')
xlabel('Valores de N')