clear all, close all, clc
%% Apartado A
    randn('seed',0);
%% Apartado B
    N = 5000;
    Pw1 = 0.5;
    Pw2 = 0.5;
    
    NumW1 = N*Pw1;
    NumW2 = N*Pw2;

    LongW1 = 20;
    LongW2 = 25;

    stdW1  = 3; 
    stdW2  = 2;

    X = [LongW1+stdW1*randn(1,NumW1) LongW2+stdW2*randn(1,NumW2)];
    Y = [ones(1,NumW1) 2*ones(1,NumW2)];

    [X,Y]=shuffle(X,Y);

    x=X(1:5000);
    y=Y(1:5000);
%% Apartado C

    m1 = mean(x(find(y == 1))); 
    m2 = mean(x(find(y == 2))); 
    s1 = std(x(find(y == 1)));
    s2 = std(x(find(y == 2)));
  
    A = s1*s1 - s2*s2;
    B = 2*(m1*s2*s2 - m2*s1*s1);
    C = 2*s1*s1*s2*s2 * (log(Pw1) - log(Pw2) - log(s1)+log(s2)) + s1*s1*m2*m2-s2*s2*m1*m1;
    
    x1 = (-B + sqrt(B*B-4*A*C))/2/A;
    x2 = (-B - sqrt(B*B-4*A*C))/2/A;
    
    m = (m1 + m2)/2;
    
    if abs(m-x1) < abs(m-x2)
        optimal_decision1 = x1;
    else
        optimal_decision1 = x2;
    end
    
    optimal_decision1
    
%% Apartado D
    clear all, close all
    randn('seed',0);
    N = 5000;
    Pw1 = 0.7;
    Pw2 = 0.3;
    
    NumW1 = N*Pw1;
    NumW2 = N*Pw2;

    LongW1 = 20;
    LongW2 = 25;

    stdW1  = 3; 
    stdW2  = 2;

    X = [LongW1+stdW1*randn(1,NumW1) LongW2+stdW2*randn(1,NumW2)];
    Y = [ones(1,NumW1) 2*ones(1,NumW2)];

    [X,Y]=shuffle(X,Y);
    
    x=X(1:5000);
    y=Y(1:5000);
    
    m1 = mean(x(find(y == 1))); 
    m2 = mean(x(find(y == 2))); 
    s1 = std(x(find(y == 1)));
    s2 = std(x(find(y == 2)));
  
    A = s1*s1 - s2*s2;
    B = 2*(m1*s2*s2 - m2*s1*s1);
    C = 2*s1*s1*s2*s2 * (log(Pw1) - log(Pw2) - log(s1)+log(s2)) + s1*s1*m2*m2-s2*s2*m1*m1;
    
    x1 = (-B + sqrt(B*B-4*A*C))/2/A;
    x2 = (-B - sqrt(B*B-4*A*C))/2/A;
    
    m = (m1 + m2)/2;
    
    if abs(m-x1) < abs(m-x2)
        optimal_decision2 = x1;
    else
        optimal_decision2 = x2;
    end
    
    optimal_decision2

%% Apartado E
    clear all, close all
    randn('seed',0);
    N = 5000;
    Pw1 = 0.3;
    Pw2 = 0.7;
    
    NumW1 = N*Pw1;
    NumW2 = N*Pw2;

    LongW1 = 20;
    LongW2 = 25;

    stdW1  = 3; 
    stdW2  = 2;

    X = [LongW1+stdW1*randn(1,NumW1) LongW2+stdW2*randn(1,NumW2)];
    Y = [ones(1,NumW1) 2*ones(1,NumW2)];

    [X,Y]=shuffle(X,Y);
    
    x=X(1:5000);
    y=Y(1:5000);
    
    m1 = mean(x(find(y == 1))); 
    m2 = mean(x(find(y == 2))); 
    s1 = std(x(find(y == 1)));
    s2 = std(x(find(y == 2)));
  
    A = s1*s1 - s2*s2;
    B = 2*(m1*s2*s2 - m2*s1*s1);
    C = 2*s1*s1*s2*s2 * (log(Pw1) - log(Pw2) - log(s1)+log(s2)) + s1*s1*m2*m2-s2*s2*m1*m1;
    
    x1 = (-B + sqrt(B*B-4*A*C))/2/A;
    x2 = (-B - sqrt(B*B-4*A*C))/2/A;
    
    m = (m1 + m2)/2;
    
    if abs(m-x1) < abs(m-x2)
        optimal_decision3 = x1;
    else
        optimal_decision3 = x2;
    end
    
    optimal_decision3
    
%% Apartado F
% Si ya que como podemos ver la decision optima aumenta o decrementa en una
% unidad en los apartados c y d comparados con el b.

%% Apartado A Ejercicio 2

%     A=s1*s1 - s2*s2;
%     B=2*(m1*s2*s2 - m2*s1*s1);
%     C=2*s1 * s1 * s2 * s2 * (log(L(1,2)) - log(L(2,1)) + log(Pw1) - log(Pw2) - log(s1) + log(s2)) + s1*s1*m2*m2-s2 * s2 * m1* m1;
%                              ------------------------ 
%     x1=(-B+sqrt(B*B-4*A*C))/2/A;
%     x2=(-B-sqrt(B*B-4*A*C))/2/A;

%% Apartado B
    clear all, close all
    N = 5000;
    Pw1 = 0.5;
    Pw2 = 0.5;
    
    NumW1 = N*Pw1;
    NumW2 = N*Pw2;

    LongW1 = 20;
    LongW2 = 25;

    stdW1  = 3; 
    stdW2  = 2;

    X = [LongW1+stdW1*randn(1,NumW1) LongW2+stdW2*randn(1,NumW2)];
    Y = [ones(1,NumW1) 2*ones(1,NumW2)];

    [X,Y]=shuffle(X,Y);

    x=X(1:5000);
    y=Y(1:5000);
    
    L = [0  2;
        0.8 0];

    m1 = mean(x(find(y == 1))); 
    m2 = mean(x(find(y == 2))); 
    s1 = std(x(find(y == 1)));
    s2 = std(x(find(y == 2)));
  
    A = s1*s1 - s2*s2;
    B = 2*(m1*s2*s2 - m2*s1*s1);
    C = 2*s1*s1*s2*s2 * (log(L(1,2)) - log(L(2,1)) + log(Pw1) - log(Pw2) - log(s1)+log(s2)) + s1*s1*m2*m2-s2*s2*m1*m1;
    
    x1 = (-B + sqrt(B*B-4*A*C))/2/A;
    x2 = (-B - sqrt(B*B-4*A*C))/2/A;
    
    m = (m1 + m2)/2;
    
    if abs(m-x1) < abs(m-x2)
        optimal_decision = x1;
    else
        optimal_decision = x2;
    end
    
    optimal_decision