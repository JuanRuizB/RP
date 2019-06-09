clear all, close all, clc;

% Apartado A)
rand('seed',0);

X = fix(rand(1,30)*100);

% Apartado B)
i1 = length(find(X <= 9));
i2 = length(find(X <= 19)) - i1;
i3 = length(find(X <= 29)) - i2;
i4 = length(find(X <= 39)) - i3;
i5 = length(find(X <= 49)) - i4;
i6 = length(find(X <= 59)) - i5;
i7 = length(find(X <= 69)) - i6;
i8 = length(find(X <= 79)) - i7;
i9 = length(find(X <= 89)) - i8;
i10 = length(find(X <= 99)) - i9;

% Apartado C)
hist(X);
% Muestra los intervalos de los datos dividiendolos entre el minimo y 
% el maximo de los datos.
[a,b] = hist(X);
% Mete en a el tamaño de cada intervalo calculado y en b el centro 
% de cada intervalo
a=hist(X,5:10:95);
% Mete en A el tamaño de cada intervalo especificando el centro de estos
% intervalos en el segundo parametro
[a,b]=hist(X,5:10:95);
% Mete en a el tamaño de cada intervalo calculado y en b el centro 
% de cada intervalo, que sera el segundo parametro.
hist(X,5:10:95);
% Apartado D)
% Representan el tamaño del primer intervalo y del ultimo intervalo.

% Apartado E)
sum(X); 
% Suma de todos los datos.

% Apartado F)
tam = sum(a);

Probabilidades = a/tam * 100;
% La probabilidad de coger un elemento aleatorio de X y de que pertenezca
%  a un i intervalo es Probabilidad(i)

% Apartado G)
sum(Probabilidades);
% El resultado de sumar todas las probabilidades es 100% ya que la
% probabilidad de coger un elemento aleatorio y este en cualquiera de los
% intervalos es del 100%

% Apartado H)
X = fix(rand(1,1000)*100);
subplot(1,2,1),hist(X,25:50:75),title('Pocas barras');
subplot(1,2,2),hist(X,0.5:1:99.5),title('Muchas barras');

% Apartado I)
X = fix(rand(1,100000)*100);
hist(X,5:10:95);

% EJERCICIO 2--------------------------------------------------------------
% Apartado A)
rand('seed',0);

X = rand(1,100000);
Y = randn(1,100000);

% Apartado B)
subplot(1,2,1),hist(X),title('Historama de X');
subplot(1,2,2),hist(Y),title('Historama de Y');
Mx = mean(X);
My = mean(Y);
Rx = range(X);
Ry = range(Y);
[ax,bx] = hist(X);
[ay,by] = hist(Y);
Sx = sum(ax);
Sy = sum(ay);
MaxX = max(X);
minX = min(X);
MaxY = max(Y);
minY = min(Y);
MaxhistX = max(ax);
MaxhistY = max(ay);

% Apartado C)
Dev_Y = std(Y);

i1 = length(find(Y >= My - Dev_Y & Y <= My + Dev_Y))
i2 = length(find(Y >= My - 2*Dev_Y & Y <= My + 2*Dev_Y))
i3 = length(find(Y >= My - 3*Dev_Y & Y <= My + 3*Dev_Y))
