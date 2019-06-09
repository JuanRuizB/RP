clear all, close all, clc;
x = [0.1 0.2 0.4 0.6 0.4 0.8 0.5 0.3;
     0.6 0.8 0.5 0.3 0.4 0.2 0.5 0.8;
     0.2 0.3 0.1 0.2 0.8 0.6 0.8 0.4;
     0.9 0.8 0.7 0.3 0.1 0.4 0.3 0.6;];
y = [1 1 2 3 3 3 2 1];
carac = [0.5; 0.8; 0.5; 0.7];


tiempo = predictor_tiempo(x,y)

function tiempo = predictor_tiempo(x,y)

    for i=1:max(y)
        m(:,i) = meanpat(x(:,find(y == i))); % = mean(x(:,find(y == i))')';
        C{i} = covpat(x(:,find(y == i)));    % = cov(x(:,find(y == i))');
        Pw(i) = length(find(y==i));
    end
    Pw = Pw/sum(Pw);
    
    for k = 1:length(y)
        xi = x(:,k);
        
        PXcw1 = mvnpdf(xi',m(:,1)',C{1});
        PXcw2 = mvnpdf(xi',m(:,2)',C{2});
        PXcw3 = mvnpdf(xi',m(:,3)',C{3});
        
        PXcw1(find(PXcw1 == ISNAN)) = 0;
        PXcw2(find(PXcw2 == ISNAN)) = 0;
        PXcw3(find(PXcw3 == ISNAN)) = 0;
        
        [~,clase(k)] = max([Pw(1)*PXcw1 Pw(2)*PXcw2 Pw(3)*PXcw3]);
    end
end