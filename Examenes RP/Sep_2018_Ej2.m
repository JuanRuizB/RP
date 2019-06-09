clear all, close all, clc;
load iris;
y = y+1;

clase_e = c_euclidea(x,x,y)
clase_m = c_mahal(x,x,y)
[Media_error_eu,Media_error_ma] = val_cruzada(x,y)
[Media_error_eu_d,Media_error_ma_d] = val_cruzada_dim(x,y)

function clase = c_euclidea(x1,x,y)
    for i = 1:max(y)
        m(:,i) = meanpat(x(:,find(y==i)));
    end
    
    for i = 1:max(y)
        d(i,:) = d_euclid(x1,m(:,i));
    end
    [basura,clase] = min(d);
end

function clase = c_mahal(x1,x,y)
    for i = 1:max(y)
        m(:,i) = meanpat(x(:,find(y==i)));
        C{i} = covpat(x(:,find(y==i)));
    end
    
    for i = 1:max(y)
        d(i,:) = d_mahal(x1,m(:,i),C{i});
    end
    
    [~,clase] = min(d);
end

% -------------------------------------------------------------------------

function [Media_error_eu,Media_error_ma] = val_cruzada(x,y)
    S = 2;
    k = length(x)/S;
    refA = 1;
    refB = k;
    
    for i = 1:S
        xtrn = x; xtrn(:,refA:refB) = [];
        ytrn = y; ytrn(:,refA:refB) = [];
        xtst = x(:,refA:refB);
        ytst = y(:,refA:refB);
        
        clase_e = c_euclidea(xtst,xtrn,ytrn);
        error_e(i) = (length(find(clase_e-ytst ~= 0))*100)/length(xtst);
        
        clase_m = c_mahal(xtst,xtrn,ytrn);
        error_m(i) = (length(find(clase_m-ytst ~= 0))*100)/length(xtst);
        
        refA = refA + k;
        refB = refB + k;
    end
    Media_error_eu = mean(error_e);
    Media_error_ma = mean(error_m);

end

function [Media_error_eu,Media_error_ma] = val_cruzada_dim(x,y)
    S = 2;
    k = length(x)/S;
    refA = 1;
    refB = k;
    
    W = fisher(x,y,2);
    xd = W*x;
    
    for i = 1:S
        xtrn = xd; xtrn(:,refA:refB) = [];
        ytrn = y; ytrn(:,refA:refB) = [];
        xtst = xd(:,refA:refB);
        ytst = y(:,refA:refB);
        
        clase_e = c_euclidea(xtst,xtrn,ytrn);
        error_e(i) = (length(find(clase_e-ytst ~= 0))*100)/length(xtst);
        
        clase_m = c_mahal(xtst,xtrn,ytrn);
        error_m(i) = (length(find(clase_m-ytst ~= 0))*100)/length(xtst);
        
        refA = refA + k;
        refB = refB + k;
    end
    Media_error_eu = mean(error_e);
    Media_error_ma = mean(error_m);

end