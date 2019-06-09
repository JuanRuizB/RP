clear all
close all

% rng('shuffle');
rng(0);

MA = [0, 0];
MB = [3, 3];
CA = [1 0.8; 0.8 2];
CB = [1 -0.9; -0.9 2];

cA = randnorm(MA,CA,1000);
cB = randnorm(MB,CB,1000); 
    
cA(3,:) = 1;
cB(3,:) = 2;

C = [ cA cB; ];
C = shuffle(C);
C = C(:,1:1600);
y = C(3,:)
C(3,:) = [];

% ---------------------Apartado A-----------------------------
plot(cA(1,:),cA(2,:),'*r');hold on;
plot(cB(1,:),cB(2,:),'*b');
% Calculo del modelo (media y C por cada clase)
for i=1:2
    ind = find(y==i);
    m(:,i) = meanpat(C(:,ind));
    E{i}   = covpat(C(:,ind));
end  
% % Clasificacion (buscar el prototipo mas cercano a cada dato

for i=1:2  
    d(i,:)=d_euclid(C,m(:,i));
end
[basura,claseA]=min(d);
tasa_aciertoA = sum(claseA==y)/length(y)*100
plot(m(1,:),m(2,:),'*g');hold off;

% ---------------------Apartado B-----------------------------


% Clasificacion (buscar la clase mas cercana a cada dato)
for i=1:2  
  d(i,:)=d_mahal(C,m(:,i),E{i});
end
[basura,claseB]=min(d);
tasa_aciertoB = sum(claseB==y)/length(y)*100
