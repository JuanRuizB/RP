%Apartado b.
x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

coefs = polyfit(x,y,1);
xr = [40 120];
yr = polyval(coefs,xr);
plot(x,y,'og'); hold on; 
plot(xr,yr,'r'); % Pintamos la recta
legend('Datos','Recta');
% ---------------------------------------
% Apartado f.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';
[x p] = sort(x);
 y = y(p);
polisol = polyfit(x,y,2);

xp = linspace(40,120);
yp = polyval(polisol,xp);
plot(x,y,'og'); hold on;
plot (xp,yp,'b');
legend('Datos','Recta');
% %--------------------------------------------
% Apartado g.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

coefs = polyfit(x,y,3);

xp=linspace(40,120);
yp = polyval(coefs,xp);

axis([40 120 0 80]); 
plot (xp,yp,'y');
legend('Datos','Recta');
% --------------------------------------------
% Apartado h.
x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';
[x p] = sort(x);
y = y(p);
y2 = 1./(y.*y);
ys = log(y2);

coefs = polyfit(x,ys,1);

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

coefs = polyfit(x2,ys,1);

b = coefs(2);
C = exp(b);
A = coefs(1);
xi = min(x2):0.01:max(x2);
yi = C.*xi.*exp(A*xi);

plot(x2,y2,'og');hold on;
plot(xi,yi,'r');hold off;

%--------------------------------------
%--------------------------------------
%Ejercicio 2.
% Apartado f.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';
[x p] = sort(x);
 y = y(p);
polisol = polyfit(x,y,2);
r = roots(polisol);    % Raices 

xp = linspace(40,120);
yp = polyval(polisol,xp);
plot(x,y,'og'); hold on;
plot (xp,yp,'b');
legend('Datos','Recta');
%--------------------------------------
% Apartado g.

x = [90 86 67 89 81 75]';
y = [62 45 40 55 64 53]';

coefs = polyfit(x,y,3);
r = roots(coefs); % Raices 

xp=linspace(40,120);
yp = polyval(coefs,xp);

axis([40 120 0 80]); 
plot (xp,yp,'y');
legend('Datos','Recta');
