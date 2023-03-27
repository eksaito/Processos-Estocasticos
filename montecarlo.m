%% Estimar PI
clear;clc
n = 1000;

k = rand(n,2);

r = sqrt(k(:,1).^2+k(:,2).^2);

s = sum(r<1)/n;
p = 4*s;
%% Ultimo exemplo do capitulo 1 do peebles
clear;clc

nloop = 1000000;
N = 120;
k = 50;
p = 0.4;
hit = 1:nloop;
for ind = 1:nloop
    x = rand(1,N);
    hit(ind) = sum(x <= p);
end
sum(hit == k )/nloop
%% Distribuição do exemplo

clear;clc

nloop = 10000;
N = 120;
p = 0.4;
hit = 1:nloop;
dist = 1:N;

for k = 1:N

    for ind = 1:nloop
    x = rand(1,N);
    hit(ind) = sum(x <= p);
    end
    dist(k) = sum(hit == k )/nloop;    
end

plot(1:N,dist,'o')