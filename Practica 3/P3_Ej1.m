[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
cont = 0;
z = (sin((1/2).*x.^2 - (1/4).*y.^2 + 3).*cos(2.*x + 1 + exp(y)));
    close all
    pcolor(x,y,z),shading flat;hold on;

    sol = [0.5; 0];
    i = 1;
    distancia = inf;
    while distancia > realmin
       x=sol(1,i);
       y=sol(2,i);
       dx = x.*cos(2.*x + exp(y) + 1).*cos((x.^2)./2 - (y.^2)./4 + 3) - 2.*sin(2.*x + exp(y) + 1).*sin((x.^2)./2 - (y.^2)./4 + 3);
       dy = exp(y).*sin((y.^2)./4 - (x.^2)./2 -3) .* sin(exp(y) + 2.*x + 1) - (y.*cos((y.^2)./4 - (x.^2)./2 -3).*cos(exp(y) + 2.*x + 1))./2;
       sol(:,i+1) = sol(:,i) - 0.1 * [dx;dy]; % AQUI
       distancia = sqrt((x - sol(1,i+1))^2 + (y - sol(2,i+1))^2);
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
       cont = cont +1;
       i = i+1;
    end
    cont
%     Para una distancia de paso de 0.1 lo realiza en 582 iteraciones
%     Para una distancia de paso de 0.01 lo realiza en 5599 iteraciones
%     Para una distancia de paso de 1 lo realiza en 353 iteraciones
%     Para encontrar la mejor distancia de paso se ha ido comprobando
%     manualmente hasta encontrar que con una distancia de 0.665 se
%     minimiza el numero de iteraciones.










