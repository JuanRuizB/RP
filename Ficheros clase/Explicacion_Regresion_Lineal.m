x=[1.86 1.75 1.94 1.70 2.03 1.87];
y=[  75   70   82   65   90   80];

coefs = polyfit(x,y,1); % polyfit: ajusta un polinomio con los valores de x
                        % e y de grado 1 en este caso.
                        
xi = [1.50 2.10];

yi = coefs(1)*xi + coefs(2);

plot(x,y,'*g'); hold on; 
plot(xi,yi,'r'); hold off

    % Lo que hace la funcion polyfit por dentro:
A=[sum(x.^2)   sum(x)
    sum(x)      length(x)];

b=[sum(x.*y);sum(y)];

coefs2 = INV(A)*b;

    % Fin explicacion polyfit.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Para casos de que no sea una recta, si no una exponencial, 
%se utiliza un cambio de variable para sacar A y B.

x=[0.5 1.2 1.94 1.70 0.03 1.87];
y= 5.2 * exp(1.3*x);
plot(x,y,'*');

ys = log(y);
coefs3 = polyfit(x,ys,1);

B = coefs(1);
A = exp(coefs(2));

xi = 0:0.01:2;
yi = A*exp(B*xi);

