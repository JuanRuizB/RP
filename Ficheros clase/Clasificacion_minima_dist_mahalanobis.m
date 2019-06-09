load iris
y = y+1;

%Calculo del modelo(media y C por cada clase)
for i = 1:3,
    ind = find(y==i);
    m(:,i)=meanpat(x(:,ind)); % meanpat hace la media.
    C{i}=covpat(x(:,ind));
end

% Clasificacion (buscar la clase mas cercano a cada dato)
for j=1:3,
    d(i,:)=d_mahal(x,m(:,i),C{i});
end

[basura,clase] = min(d);
% Calculo del error cometido
tasa_acierto = sum(clase==y)/length(y)*100