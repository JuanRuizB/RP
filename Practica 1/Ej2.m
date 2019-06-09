function Ej2

x1 = (-5:0.02:5);
y = x1.^2 - 3*x1 -2;
subplot(2,1,1);
plot(x1,y,'-g');hold on;
plot(2,1,'+r');hold off;
z = x1.^3 - 2*x1 + 1;
subplot(2,1,2);
plot(x1,z,'--b');hold on;
plot(2,1,'+r');hold off;

end