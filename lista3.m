%% Lista 3
% Resolução da lista de exercícios
% Lista 3
% Data: 11/08/2020
% Data de entrega: 19/08/2020
%% Exercício 16
clear;clc;
p = 0.6; %0
q = 1-p; %1
x0 = logical([1 0 1 1 0]);
k = sum(x0 == 0); % número de 0
n = length(x0);
nloop = 100000;
x = rand(nloop,n); %geração de valores aleatorios

for indloop = 1:nloop
X(indloop,:) = ~(x(indloop,:) <=p); %sequencia
z(indloop) = sum(X(indloop,:) == x0) == n; %sequencias iguais a x0
t(indloop) = n-sum(X(indloop,:)); %número de 0 por sequencia
end

f = factorial(n)/(factorial(k)*factorial(n-k));

px_estimado = sum(t==k)/(f*nloop) %estimado a partir do número de variáveis iguais a 0
px_simulado = sum(z)/nloop %obtido da simulação
px_equacionado = (p^k)*(q^(n-k)) %obtido do equacionamento de p(x)

p_ML = sum(t)/(5*nloop) %estimador ML do parametro p
p_px = (sum(t==5)/(nloop))^(1/5) %estimado a partir do p(x)
%%
clear;clc
load('D:\Users\Eric\Desktop\Doutorado\Disciplinas\COE777\Listas\Lista 3\t-MC.txt')
nloop = length(t_MC);

x0 = logical([1 0 1 1 0]);
k = sum(x0 == 0);
n = length(x0);
f = factorial(n)/(factorial(k)*factorial(n-k));
px_estimado = sum(t_MC==2)/(f*nloop)
p_ML = sum(t_MC)/(5*nloop)
p_px = (sum(t_MC==5)/(nloop))^(1/5)