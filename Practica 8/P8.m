    clear all, close all, clc;
%% Apartado A
    randn('seed',0);
    A = round(20+randn(1,500)*5); %Golden
    B = round(30+randn(1,500)*2); %Bass
%% Apartado B
    a = hist(A,5.5:1:36);
    b = hist(B,5.5:1:36);
%% Apartado C
    tamA = sum(a);
    tamB = sum(b);

    ProbabilidadesA = a/tamA * 100;
    ProbabilidadesB = a/tamB * 100;
%% Apartado D
    A = round(20+randn(1,500)*5); %Golden
    B = round(30+randn(1,500)*2); %Bass

    X = shuffle([A B;ones(1,500) ones(1,500)*2]);

    aux1 = find(X(1,:) <= 24);
    aux2 = find(X(1,:) > 24);
    error24 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 25);
    aux2 = find(X(1,:) > 25);
    error25 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 26);
    aux2 = find(X(1,:) > 26);
    error26 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 27);
    aux2 = find(X(1,:) > 27);
    error27 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 28);
    aux2 = find(X(1,:) > 28);
    error28 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    error24 = error24/1000 *100
    error25 = error25/1000 *100
    error26 = error26/1000 *100
    error27 = error27/1000 *100
    error28 = error28/1000 *100
%% Apartado E
    A = round(20+randn(1,500)*5); %Golden
    B = round(30+randn(1,50)*2); %Bass

    X = shuffle([A B;ones(1,500) ones(1,50)*2]);

    aux1 = find(X(1,:) <= 24);
    aux2 = find(X(1,:) > 24);
    error24 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 25);
    aux2 = find(X(1,:) > 25);
    error25 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 26);
    aux2 = find(X(1,:) > 26);
    error26 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 27);
    aux2 = find(X(1,:) > 27);
    error27 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 28);
    aux2 = find(X(1,:) > 28);
    error28 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    error24 = error24/550 *100
    error25 = error25/550 *100
    error26 = error26/550 *100
    error27 = error27/550 *100
    error28 = error28/550 *100

%---------------------------------

    A = round(20+randn(1,50)*5); %Golden
    B = round(30+randn(1,500)*2); %Bass

    X = shuffle([A B;ones(1,50) ones(1,500)*2]);


    aux1 = find(X(1,:) <= 24);
    aux2 = find(X(1,:) > 24);
    error24 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 25);
    aux2 = find(X(1,:) > 25);
    error25 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 26);
    aux2 = find(X(1,:) > 26);
    error26 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 27);
    aux2 = find(X(1,:) > 27);
    error27 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    aux1 = find(X(1,:) <= 28);
    aux2 = find(X(1,:) > 28);
    error28 = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));

    error24 = error24/550 *100
    error25 = error25/550 *100
    error26 = error26/550 *100
    error27 = error27/550 *100
    error28 = error28/550 *100

%% Apartado F

    A = round(20+randn(1,500)*5); %Golden
    B = round(30+randn(1,500)*2); %Bass

    X = shuffle([A B; ones(1,500) ones(1,500)*2]);

    indices1 = find(X(2,:) == 1);
    indices2 = find(X(2,:) == 2);
    
    m1 = mean(X(1,indices1));
    m2 = mean(X(1,indices2));
    
    s1 = std(X(1,indices1));
    s2 = std(X(1,indices2));
    
    Pw1 = length(indices1)/length(X);
    Pw2 = length(indices2)/length(X);
    
    A = s1*s1 - s2*s2;
    B = 2*(m1*s2*s2 - m2*s1*s1);
    C = 2*s1*s1*s2*s2 * (log(Pw1) - log(Pw2) - log(s1)+log(s2)) + s1*s1*m2*m2-s2*s2*m1*m1;
    
    x1 = (-B + sqrt(B*B-4*A*C))/2/A
    x2 = (-B - sqrt(B*B-4*A*C))/2/A
    
    aux1 = find(X(1,:) <= x2);
    aux2 = find(X(1,:) > x2);
    errorN = length(find(X(2,aux1) == 2)) + length(find(X(2,aux2) == 1));
    
    errorN = errorN/1000 * 100
    
    