load iris

A = [x(1:3,:);ones(size(y))]';
b = x(4,:)';

coefs = pinv(A)*b;

yest = A*coefs;

plot(b, 'b'); hold on;
plot(yest,'r');hold on;
legend('real','estimado');