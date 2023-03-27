%% Lista 3b
% Resolução da lista de exercícios
% Lista 3
% Data: 11/08/2020
% Data de entrega: 19/08/2020
%% Exercício 17
clear;clc;close all

% Constantes
n = 1000000;
nloop = 10000;
% f(theta)
m0 = 0;
var0 = 1; dp0 = sqrt(var0);
% f(x|theta)
var1 = 10; dp1 = sqrt(var1);

m1 = zeros(1,nloop);
mi = zeros(1,nloop);
dp = zeros(1,nloop);
mi_ML = zeros(1,nloop);
dp_ML = zeros(1,nloop);
mi_MAP = zeros(1,nloop);

for ind = 1:nloop
m1(ind) = dp0*randn(1,1)+m0;
x = dp1*randn(n,1)+m1(ind);

mi(ind) = mean(x);
dp(ind) = sqrt(var(x));
% Estimadores
mi_ML(ind) = sum(x)/length(x);
dp_ML(ind) = sqrt(sum((x-mi_ML(ind)).^2)/(length(x)-1)); %N-1 -> estimador não polarizado
mi_MAP(ind) = (m0*(dp_ML(ind)^2)+var0*sum(x))/(dp_ML(ind)+n*var0) ;
erro_mi_ML(ind) = mi_ML(ind) - m1(ind);
erro_mi_MAP(ind) = mi_MAP(ind) -m1(ind);
end

figure(1)
histogram(mi_ML)
title('Estimador ML para mi')
hold on
histogram(m1)
legend('mi ML','mi real')

figure(2)
histogram(mi_MAP)
title('Estimador MAP para mi')
hold on
histogram(m1)
legend('mi MAP','mi real')

figure(3)
histogram(dp_ML)
title('Estimador ML para dp')


 figure(4)
subplot(2,1,1)
 plot(erro_mi_ML.^2)
 title('Erro quadratico do estimador ML para mi')
 subplot(2,1,2)
  plot(erro_mi_MAP.^2)
 title('Erro quadratico do estimador MAP para mi')

