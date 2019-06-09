clear all,close all, clc;

rand('seed',0);
randn('seed',0);

NumND = 2e6;
NumNL = 2e6;

LongD = 25;
LongL = 32;

stdD = 2;
stdL = 2;

X = [LongD + stdD * randn(1,NumND)   LongL + stdL * randn(1,NumNL)];
Y = [ones(1,NumND) 2*ones(1,NumNL)];

[X,Y] = shuffle(X,Y);


x = X(1:1000);
y = Y(1:500);

% Me olvido de X e Y. Solo tengo x e y.

% Metodo de la distancia minima.
m1 = mean(x(find(y == 1))); %Media para el pez 1.
m2 = mean(x(find(y == 2))); %Media para el pez 2.
s1 = std(x(find(y == 1)));
s2 = std(x(find(y == 2)));
P1 = length(find(y == 1))/length(y);
P2 = length(find(y == 2))/length(y);

m = (m1 + m2)/2; % Punto medio entre las dos medias.

% 
aux = y(find(x<m));
e1 = length(find(aux == 2));
aux = y(find(x>m));
e2 = length(find(aux == 1));

e = e1+e2; %error total
xi=15:0.1:40;

plot(xi,P1*normpdf(xi,m1,s1));hold on;
plot(xi,P2*normpdf(xi,m2,s2),'r');hold off;




