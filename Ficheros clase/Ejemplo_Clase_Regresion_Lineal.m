close all, clear all, clc
rand('seed',0);
randn('seed',0);

x = rand(100,1);
y = 3*x.^2-2*x+3 + 0.1*randn(size(x));

plot(x,y,'or');hold on

% p = polyfit(x,y,2);

A = [x.^2 x ones(size(x))];
coefs = pinv(A) * y;

xi = 0:0.01:1;
yi = polyval(coefs,xi);
plot(xi,yi,'-y');hold off
