%% Lista 2
% Resolução da lista de exercícios
% Lista 2
% Data: 31/07/2020
% Data de entrega: 05/08/2020
%% Exercício 14
n = 1000000;

x = rand(n,1); % Distribuição uniforme
z = exprnd(1,n,1); %Distribuição exponencial
y = -log(x); % Função de transformação

figure(1)
histogram(x,100)
title('Histograma de X~Uniforme(0,1)')

figure(2)
histogram(y,100)
title('Histograma de Y')

figure(3)
histogram(z,100)
title('Histograma de Z~exp(0,1)')

figure(4)
histogram(y,100)
hold on
histogram(z,100)
title('Histograma de Y e Z')
