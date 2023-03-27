%% Lista 1 (1-7 exercicios)
% Resolução da lista de exercícios
% Lista 1
% Data: 14/07/2020
% Data de entrega: 22/07/2020

%% Exercício 1
clear;clc
Nloop = 100;

for nP = 2:2:Nloop
    for nV = 2:Nloop %"Quando retiramos, aleatoriamente, duas meias da gaveta..." 
        x = nV^2 - nV - 2*nV*nP + nP - nP^2
        if x == 0
            break
        end
    end
    if x == 0
        break
    end
end
%% Exercicio 5
clear;clc
Nloop = 52;
n = 13;
J = 4;
k = 1;
x = 1;

while k < 13
    
    x = x * (n-k)/(Nloop - 4*k);
    k = k + 1;
end

x2 = 1;
for ind = 1:n-1
    
    x2 = x2 * (n - ind)/(Nloop - ind);
    n-ind
    Nloop-ind
    
end

% (12*11*10*9*8*7*6*5*4*3*2*1)/(52*51*50*49*48*47*46*45*44*43*42*41*40)

