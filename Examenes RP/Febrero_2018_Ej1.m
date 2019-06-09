clear all, close all, clc;
randn('seed',0);
[datos,y] = generadatos();
[d1,d2] = densidades(datos,y);
plot(-10:0.01:10,d1);hold on;
plot(-10:0.01:10,d2);hold off;

xr = [0.5 0.6 0.8 1.5 2 2.5];

clase = clasificador(xr,d1,d2)

function [datos,y] = generadatos()

datos = [randnorm(0,4,1000*0.55) randnorm(2,4,1000*0.45)];
y = [ones(1,1000*0.55) ones(1,1000*0.45)*2];
[datos,y] = shuffle(datos,y);
end

function [d1,d2] = densidades(datos,y)
desvtipica = 0.5;

x = -10:0.01:10;
d1 = 0; d2 = 0;
ind1 = find(y == 1);
ind2 = find(y == 2);
for i = 1:length(datos)*0.55
    d1 = d1 + normpdf(x,datos(ind1(i)),desvtipica);
    if i <= length(ind2)
        d2 = d2 + normpdf(x,datos(ind2(i)),desvtipica);
    end
end
d1 = d1/length(ind1);
d2 = d2/length(ind2);
% d1 = d1*0.55;
% d2 = d2*0.45;
end

function clase = clasificador(x,d1,d2)
    
    I = -10:0.01:10;
    I = round(I,2,'significant');
    for i = 1:length(x)
        % Obligo a que x este en [-10..10]
        x(i) = min(x(i),10);
        x(i) = max(x(i),-10);
        % Busco la posicion de x en el vector I
        x(i) = round(x(i)*100)/100; % Dejamos x con 2 decimales
        pos = find(I==x(i)); 

         if d1(pos)>d2(pos)
            clase(i)=1;
         else
            clase(i)=2;
         end
    end
end