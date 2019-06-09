clc, close all, clear all;
load iris;
y=y+1;

for i = 1:3
    m(:,i) = meanpat(x(:,find(y==i)));
    C{i} = covpat(x(:,find(y==i)));
    Pw(i) = lentgh(find(y==i)); %Calcula el numero de elementos de cada clase.
end
Pw = Pw/sum(Pw); %Saca la probabilidad de cada clase dividiendo el numero de elementos
                 % de cada clase y dividiendolo entre el total,

% xi = x(:,122);

for k = 1:150
    xi = x(:,k);

% Probabilidades a priori
Pw1 = Pw(1); Pw2 = Pw(2); Pw3 = Pw(3); %Es un tercio por que al comprobar en y
                                 % la cantidad de datos de cada clase resulta que hay 50 datos de cada clase
                                 % en 150 datos por lo tanto la probabilidad de cada clase es 1/3 

PWow1 = mvnpdf(xi',m(:,1)',C{1});
PWow2 = mvnpdf(xi',m(:,2)',C{2});
PWow3 = mvnpdf(xi',m(:,3)',C{3});

[basura,clase(k)] = max([Pw1*PWow1 Pw2*PWow2 Pw3*PWow3])


end