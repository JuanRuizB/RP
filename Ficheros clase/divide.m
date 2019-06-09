function [A,B] = divide(M,n)

A = M(:,1:(size(M,2)*n/100));
B = M(:,(size(M,2)*n/100)+1:size(M,2));

 plot(A(1,:),A(2,:),'*r')
 hold on
 plot(B(1,:),B(2,:),'*g')
 title('Resultado de la Funcion Divide');
 legend('Puntos de A','Puntos de B');

end