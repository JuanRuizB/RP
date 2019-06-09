clear all
close all
[x,y]=meshgrid(-15:0.1:15,-15:0.1:15);
z = 100.*(x.^2 - y.^2)+(1+x).^2;

    pcolor(x,y,z),shading flat;hold on;

    sol = [10; 10];
    cont = 0;
    i = 1;
    distancia = inf;
    while distancia > realmin
       x=sol(1,i);
       y=sol(2,i);
       dx = 2.*(x+1) + 200.*x;  
       dy = -200.*x;       
       dxx = 202;         dxy = 0;
       dyx = 0;                     dyy = -200;       
       H = [dxx dxy;dyx dyy];                     
       sol(:,i+1) = sol(:,i) - 0.1 * inv(H)  * ([dx;dy]);   
       distancia = sqrt((x - sol(1,i+1))^2 + (y - sol(2,i+1))^2);
       plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')
       cont = cont +1;
       i = i+1;
       pause
    end
   