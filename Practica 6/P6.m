close all
clear all
clc

rand('seed', 0);
randn('seed', 0);
x = rand(1,100);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));

%% Validacion Simple
for i = 1:1000 
    [xs,ys] = shuffle(x,y);
    xs = xs';
    ys = ys';
    
    xtrn = xs(1:length(xs)*0.7);
    ytrn = ys(1:length(xs)*0.7);
    xtst = xs(length(xs)*0.7+1:end);
    ytst = ys(length(xs)*0.7+1:end);

    
    % Polinomio de grado 1.
    A = [xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst + sol(2);

    Er1 = abs(yestim-ytst);
    Media_Er1(i) = mean(Er1);
    % Polinomio de grado 2.
    xtrn2 = xtrn.*xtrn;

    A = [xtrn2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst.*xtst + sol(2)*xtst + sol(3);
    Er2 = abs(yestim-ytst);
    Media_Er2(i) = mean(Er2);

    % Polinomio de grado 3.
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;

    A = [x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr = sol(1)*xtst.*xtst.*xtst + sol(2)*xtst.*xtst + sol(3)*xtst + sol(4);
    Er3 = abs(yestim-ytst);
    Media_Er3(i) = mean(Er3);
    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*xtst.*xtst.*xtst + sol(3)*xtst.*xtst + sol(4)*xtst + sol(5);
    Er4 = abs(yestim-ytst);
    Media_Er4(i) = mean(Er4);

    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x) + f * sin(x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*sin(xtst) + sol(3)*xtst.*xtst.*xtst + sol(4)*xtst.*xtst + sol(5)*xtst + sol(6);
    Er5 = abs(yestim-ytst);
    Media_Er5(i) = mean(Er5);
end
media_erroresVS_G1 = mean(Media_Er1)
media_erroresVS_G2 = mean(Media_Er2)
media_erroresVS_G3 = mean(Media_Er3)
media_erroresVS_G3sin = mean(Media_Er4)
media_erroresVS_G3sinsin = mean(Media_Er5)

%% Validacion cruzada S = 10
Media_Er1 = [];
Media_Er2 = [];
Media_Er3 = [];
Media_Er4 = [];
Media_Er5 = [];
[xs,ys] = shuffle(x,y);
xs = xs';
ys = ys';    
S = length(x)*0.1;
refA = 1;
refB = S;

for i = 1:10
    xtrn = xs; xtrn(refA:refB) = [];
    ytrn = ys; ytrn(refA:refB) = [];
    xtst = xs(refA:refB);
    ytst = ys(refA:refB);

    % Polinomio de grado 1.
    A = [xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst + sol(2);

    Er1 = abs(yestim-ytst);
    Media_Er1(i) = mean(Er1);
    % Polinomio de grado 2.
    xtrn2 = xtrn.*xtrn;

    A = [xtrn2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst.*xtst + sol(2)*xtst + sol(3);
    Er2 = abs(yestim-ytst);
    Media_Er2(i) = mean(Er2);
    % Polinomio de grado 3.
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;

    A = [x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr = sol(1)*xtst.*xtst.*xtst + sol(2)*xtst.*xtst + sol(3)*xtst + sol(4);
    Er3 = abs(yestim-ytst);
    Media_Er3(i) = mean(Er3);
    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*xtst.*xtst.*xtst + sol(3)*xtst.*xtst + sol(4)*xtst + sol(5);
    Er4 = abs(yestim-ytst);
    Media_Er4(i) = mean(Er4);

    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x) + f * sin(x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*sin(xtst) + sol(3)*xtst.*xtst.*xtst + sol(4)*xtst.*xtst + sol(5)*xtst + sol(6);
    Er5 = abs(yestim-ytst);
    Media_Er5(i) = mean(Er5);
    
    refA = refA+S;
    refB = refB+S;
end
media_erroresVC_G1 = mean(Media_Er1)
media_erroresVC_G2 = mean(Media_Er2)
media_erroresVC_G3 = mean(Media_Er3)
media_erroresVC_G3sin = mean(Media_Er4)
media_erroresVC_G3sinsin = mean(Media_Er5)

% Validacion Leave-one-out
Media_Er1 = [];
Media_Er2 = [];
Media_Er3 = [];
Media_Er4 = [];
Media_Er5 = [];
[xs,ys] = shuffle(x,y);
xs = xs';
ys = ys';    

for i = 1:length(x)
    xtrn = xs;  xtrn(i) = [];
    ytrn = ys;  ytrn(i) = [];
    xtst = xs(i);
    ytst = ys(i);

    % Polinomio de grado 1.
    A = [xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst + sol(2);

    Er1 = abs(yestim-ytst);
    Media_Er1(i) = mean(Er1);
    % Polinomio de grado 2.
    xtrn2 = xtrn.*xtrn;

    A = [xtrn2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yestim = sol(1)*xtst.*xtst + sol(2)*xtst + sol(3);
    Er2 = abs(yestim-ytst);
    Media_Er2(i) = mean(Er2);
    % Polinomio de grado 3.
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;

    A = [x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr = sol(1)*xtst.*xtst.*xtst + sol(2)*xtst.*xtst + sol(3)*xtst + sol(4);
    Er3 = abs(yestim-ytst);
    Media_Er3(i) = mean(Er3);
    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*xtst.*xtst.*xtst + sol(3)*xtst.*xtst + sol(4)*xtst + sol(5);
    Er4 = abs(yestim-ytst);
    Media_Er4(i) = mean(Er4);

    % Modelo Lineal  y = a + bx + cx2 + dx3 + e * sin (x) + f * sin(x).
    x2 = xtrn.*xtrn;
    x3 = xtrn.*xtrn.*xtrn;
    x4 = sin(xtrn);

    A = [x4(:) x4(:) x3(:) x2(:) xtrn(:) ones(size(xtrn(:)))];
    sol = pinv(A)*ytrn;

    yr =sol(1)*sin(xtst) + sol(2)*sin(xtst) + sol(3)*xtst.*xtst.*xtst + sol(4)*xtst.*xtst + sol(5)*xtst + sol(6);
    Er5 = abs(yestim-ytst);
    Media_Er5(i) = mean(Er5);
    
    refA = refA+S;
    refB = refB+S;
end
media_erroresVLOO_G1 = mean(Er1)
media_erroresVLOO_G2 = mean(Er2)
media_erroresVLOO_G3 = mean(Er3)
media_erroresVLOO_G3sin = mean(Er4)
media_erroresVLOO_G3sinsin = mean(Er5)
