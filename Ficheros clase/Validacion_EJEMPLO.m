clear all, close all, clc
load iris;
y = y+1;

[x,y] = shuffle(x,y);

% Si pusieramos un bucle for de 1000 iteraciones seria el metodo RANDOM
% SAMPLING

% VALIDACION SIMPLE 66% : 100(trn) + 50(tst)

xtrn = x(:,1:100);  ytrn = y(1:100);

xtst = x(:,101:150);  ytst = y(101:150);

% Calculo

for i =1:3
    ind = find(ytrn == i);
    m(:,i) = meanpat(xtrn(:,ind));
end

for i = 1:3
    d(i,:) = d_euclid(xtst,m(:,i));
end
[~,clase] = min(d);

tasa_acierto = sum(clase==ytst)/length(ytst)*100