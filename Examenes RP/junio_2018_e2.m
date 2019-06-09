clear all, close all, clc;
load iris;
y = y + 1;

clase = k_vecinos(x,x,y)
sumsqr(clase-y)
error = errores(x,y)

function clase = k_vecinos(x1,x,y)

for k = 1:3
    for i = 1:size(x,2)
        d = eu(x,x1(:,i)); % los datos tienen que estar en columnas.
        [~,pos] = sort(d);
        clase(i) = moda(y(pos(2:k+1)));
    end
end
end

function d = eu(x,y)
    for i = 1:size(x,2)
        d(i) = norm(x(:,i)-y);
    end
end

function error = errores(x,y)
S = 2;
k = length(x)/S;
refA = 1;
refB = k;

for i = 1:S
    xtrn = x; xtrn(:,refA:refB) = [];
    ytrn = y; ytrn(:,refA:refB) = [];
    xtst = x(:,refA:refB);
    ytst = y(:,refA:refB);
    
    clase = k_vecinos(xtst,xtrn,ytrn);
    e = sumsqr(clase - ytst);
    Media_error(i) = ((length(ytst)-e)*100)/length(ytst);
    
    refA = refA + k;
    refB = refB + k;
end
error = mean(Media_error);
end

