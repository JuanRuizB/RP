function Ej1
x1=[-2:0.05:1.95];
y1=x1.^2-x1+3;
plot(x1,y1,'-r');hold on;
x2 = [2:0.01:3.99];
y2=2.^x2+1;
plot(x2,y2,'-b');

end