% function linear_regression
% %Apartado a.
x = [90 86 67 89 81 75];
y = [62 45 40 55 64 53];
plot(x,y,'or');
   
% Si pero mas adelante se ve que con una regreson exponencial
% queda mejor representado que con una lineal.
% --------------------------------------------
%Apartado b.
x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

A = [x(:) ones(size(x(:)))];
sol = pinv(A)*y;
% r = y-A*sol;
% E = r'*r;
xr = [40 120];
yr = sol(1)*xr + sol(2);
sol
plot(x,y,'or'); hold on; 
plot(xr,yr,'r'); % Pintamos la recta
legend('Datos','Recta');

% %--------------------------------------------
% %Apartado c.
x = [90 86 89 81 75]';
y = [62 45 55 64 53]';

A = [x(:) ones(size(x(:)))];
sol = pinv(A)*y;
r = y-A*sol;
E = r'*r;
xr = [40 120];
yr = sol(1)*xr + sol(2);
sol  
plot(xr,yr,'b'); % Pintamos la recta
legend('Datos','Recta');
%La nube de puntos se dispersa aun mas y la recta disminuye su pendiente.
%--------------------------------------------
%Apartado d.

heart = sol(1)*88 + sol(2)

%--------------------------------------------
%Apartado e.
% En x = 0, ya que es una funcion lineal.
%--------------------------------------------
%Apartado f.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

x2=x.*x;

A = [x2 x ones(size(x))];
polisol = inv(A'*A)*(A'*y);

xp=linspace(40,120);
plot (xp,polyval(polisol,xp),'g');
legend('Datos','Recta');

%--------------------------------------------
% Apartado g.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

x2=x.*x;
x3=x2.*x;

A = [x3 x2 x ones(size(x))];
polisol = pinv(A)*y;

xp=linspace(40,120);
plot (xp,polyval(polisol,xp),'y');
legend('Datos','Recta');

% --------------------------------------------
% Apartado h.
x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';
[x p] = sort(x);
y = y(p);
y2 = 1./(y.*y);

ys = log(y2);

A = [x ones(size(x))];
coefs = pinv(A) * ys;
b=coefs(1);
C = coefs(2);
A = exp(C);
xi = 30:140;
yi = A*exp((b)*xi);

axis([30 140 30 180]); 
plot(x,y2,'og');hold on;
plot(xi,yi,'r');hold off;
% --------------------------------------------
% Apartado i.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';
[x p] = sort(x);
y = y(p);
x2 = x/100;
y2 = 3*x2.*exp(2*x2);

ys = log(y2./x2);

A = [x2 ones(size(x))];
coefs = pinv(A) * ys;

b = coefs(2);
C = exp(b);
A = coefs(1);
xi = min(x2):0.01:max(x2);
yi = C.*xi.*exp(A*xi);

plot(x2,y2,'og');hold on;
plot(xi,yi,'r');hold off;

