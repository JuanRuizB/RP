clear;close; clc;
load iris;
y=y+1;

clasified=[];
r=[];
nCarac = 4;
% num_C va variando el numero de caracteristicas elegidas.
for num_C=2:4
comb = nchoosek(1:nCarac, num_C)';
[x,y]=shuffle(x,y);
for i=1:size(comb,2)
    for j=1:1:10
        
        reps = Krepresentantes(x,y,j,comb(:,i));%para las distintas combinaciones de num_C caracteristicas
        clasificados = clasificar(x,y,reps,j,comb(:,i));%para las distintas combinaciones de num_C caracteristicas
        clasified = [clasified sum(y==clasificados)/length(y)*100];
    end
    r=[r; clasified]
    clasified=[];
end

subplot(3,1,num_C-1),plot(1:10,r(1,:),'g'),hold on;
if num_C < 4
    subplot(3,1,num_C-1),plot(1:10,r(2,:),'r'),hold on;
    subplot(3,1,num_C-1),plot(1:10,r(3,:),'b'),hold on;
    subplot(3,1,num_C-1),plot(1:10,r(4,:),'y'),hold on;
    if num_C < 3
        subplot(3,1,num_C-1),plot(1:10,r(5,:),'m'),hold on;
        subplot(3,1,num_C-1),plot(1:10,r(6,:),'k'),hold on;
        subplot(3,1,num_C-1),legend('características: 1-2', 'características: 1-3','características: 1-4', 'características: 2-3', 'características: 2-4', 'características: 3-4');
    else
        subplot(3,1,num_C-1),legend('Caracteristicas: 1-2-3','Caracteristicas: 1-2-4','Caracteristicas: 1-3-4','Caracteristicas: 2-3-4');
    end
else
    subplot(3,1,num_C-1),legend('Todas las caracteristicas');
end
axis([1 10, 50 100]);
r = [];
end
%para que las clases vayan de 1 a 3,en vez de 0 a 2, he sumado 1 a y
function [representantes]=Krepresentantes(x,y,k,comb)
    representantes=[];
    %Obtenemos Krepresentantes por clase
    
    for i=1:3
       representantes= [ representantes kmeans(x([comb],y==i) ,k)];
    end
    
end



function [clasificacion] = clasificar(x,y,representantes,kRepresentantes,comb)%kRepresentantes es el numero de representantes por clase
    min=Inf;
    clasificacion = [];
    %Para cada flor clasificamos, calculando la distancia de mahalanobi
    %de todos los representantes respecto a esa flo.Esa flor será de la
    %misma clase que el representante más cercano(según mahalanobi)
    for i=1 : size(y,2)
        for k=1 : size(representantes,2)
            distancias_RepK_IndivI = d_mahal(x(comb,i),representantes(:,k),McovarRepresentanteK(x,y,k,kRepresentantes,comb));
            if(distancias_RepK_IndivI < min)
                min = distancias_RepK_IndivI;
                rep = k;
            end
        end
        min=Inf;
        
        if(rep>=1 && rep<=kRepresentantes)
            clasificacion = [clasificacion 1];
        else if(rep>kRepresentantes && rep<=2*kRepresentantes)
                clasificacion = [clasificacion 2];
            else if(rep > 2*kRepresentantes && rep <= 3*kRepresentantes)
                    clasificacion = [clasificacion 3];
                end
            end
        end
    end
end

function [matCovar]=McovarRepresentanteK(x,y,k,kRepresentantes,comb)
   if(k>=1 && k<=kRepresentantes)
            matCovar = covpat(x([comb],y==1));
        else if(k>kRepresentantes && k<=2*kRepresentantes)
                matCovar = covpat(x([comb],y==2));
            else if(k > 2*kRepresentantes && k <= 3*kRepresentantes)
                    matCovar = covpat(x([comb],y==3));
                end
            end
        end
end