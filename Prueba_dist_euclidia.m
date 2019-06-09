clear all
close all
load iris
y = y+1;

% Calculo del modelo (un prototipo por cada clase)
for i=1:3
    ind = find(y==i);
    m(:,i)=meanpat(x(:,ind));
end

% Clasificacion (buscar el prototipo mas cercano a cada dato
for i=1:3  
  d(i,:)=d_euclid(x,m(:,i));
end
[basura,clase]=min(d);

% Calculo del error cometido
tasa_acierto = sum(clase==y)/length(y)*100