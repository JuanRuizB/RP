    clear all, close all, clc
%% Apartado A
    rand('seed',0); randn('seed',0);
%% Apartado B
    x = randnorm([3 4],[1 0.8; 0.8 1],1000);
%% Apartado C
    m = meanpat(x);
    x = subpat(x,m);
%% Apartado D
    W = pca(x);
%% Apartado E
    x1 = W*x;
    figure,plotpat(x,'or'),axis equal, hold on,
    plotpat(x1,'*b'),legend('Original','Converted');hold off
%% Apartado F
    x2 = pinv(W)*x1;
    figure,plotpat(x,'or'),axis equal, hold on,
    plotpat(x1,'*b');
    plotpat(x2,'.g'),legend('Original','Converted','Recomposed');hold off;
%% Apartado G
    aux = x - x2;
    aux1 = x - x1;
    s = sumsqr(aux);
    s1 = sumsqr(aux1);
    
    info_loss_Conv_G = s
    info_loss_Recon_G = s1
%% Apartado H 

    W = W - rand*0.01;
    x1 = W*x;
    x2 = pinv(W)*x1;
    
    aux = x - x2;
    aux1 = x - x1;
    s = sumsqr(aux);
    s1 = sumsqr(aux1);
    
    info_loss_Conv_H = s
    info_loss_Recon_H = s1
    
    
%% Apartado A Ejercicio 2.
    rand('seed',0); randn('seed',0);
%% Apartado B
    x1 = randnorm([3 4],[1 0.8; 0.8 1],1000);
    x2 = randnorm([5 0],[1 0.8; 0.8 1],1000);
    y=[zeros(1,1000) ones(1,1000)];

    x=[x1 x2];

    m = meanpat(x);
    x = subpat(x,m);
%% Apartado C
    W = pca(x,1);
    xp = W*x;
    xpp = pinv(W)*xp;
    
    figure,plotpat(x,y),axis equal, hold on,
    plot(xp,y,'*b'),title('PCA'),legend('Clase 1','Clase 2','Dimensionado');hold off
    
%% Apartado D
    W = fisher(x,y,1);
    xp = W*x;
    xpp=pinv(W)*xp;
    
    figure,plotpat(x,y),axis equal, hold on,
    plot(xp,y,'*b'),title('FISHER'),legend('Clase 1','Clase 2','Dimensionado');hold off;
    
%% Apartado A Ejercicio 3.

    load dnatrn;

    W = pca(x,2);
    PCA_xp = W*x;
    PCA_xpp = pinv(W)*PCA_xp;
    
   
    figure,plotpat(PCA_xp,y),title('PCA');
    
    W = fisher(x,y,2);
    FISHER_xp = W*x;
    FISHER_xpp=pinv(W)*FISHER_xp;
    
    figure,plotpat(FISHER_xp,y),title('FISHER');
    
    s = sumsqr(x);
    sPCA = sumsqr(PCA_xpp);
    sFISHER = sumsqr(FISHER_xpp);
    
    info_loss_PCA = s-sPCA
    info_loss_FISHER = s-sFISHER
    
    % Podemos observar que el metodo FISHER distribuye mejor los puntos
    % siendo mejor metodo para la clasificacion pero pierde mas informacion
    % que el metodo PCA.

%% Apartado B y C

    load diabetes;
    
    W = pca(x,2);
    PCA_xp = W*x;
    PCA_xpp = pinv(W)*PCA_xp;
   
    xs = PCA_xp(1,:)';
    ys = PCA_xp(2,:)';

    A = [xs(:) ones(size(xs(:)))];
    sol = pinv(A)*ys;

    yestim = sol(1)*xs(:) + sol(2);
    
    Er = abs(yestim - ys);
    Media_error_PCA = mean(Er)
    
    W = fisher(x,y,2);
    FISHER_xp = W*x;
    FISHER_xpp=pinv(W)*FISHER_xp;
    
    xs = FISHER_xp(1,:)';
    ys = FISHER_xp(2,:)';

    A = [xs(:) ones(size(xs(:)))];
    sol = pinv(A)*ys; % sol = inv(A'*A)*(A'*b);

    yestim = sol(1)*xs(:) + sol(2);
    
    Er = abs(yestim - ys);
    Media_error_FISHER = mean(Er)
    
%     El error con PCA sale 23.8303 y con FISHER el error sale 11.9136 por
%     lo que el metodo FISHER es mejor.
   