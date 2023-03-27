clear;clc
n = 100000;
x = 2*randn(1,n);

y1(1) = randn;
y2(1) = randn;

for ind = 2:n
    y1(ind) = x(ind) + 2*x(ind-1);
    y2(ind) = 0.5*y2(ind-1) + x(ind);
end
%%
close all
figure(1)
hold on
plot(y1)
plot(y2)
figure(2)
plot(y1,y2)
%%
[r,lag] = xcorr(y1);
[~,I] = max(abs(r));
lagDiff = lag(I)

figure
plot(lag,r/n)