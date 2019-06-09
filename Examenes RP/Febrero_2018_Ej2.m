y = A * x^M;

% Aplicamos logaritmos:
log(y) = log(A) + log(x^M);

log(y) = log(A) + M*log(x);

% Cambio de variables:

Y = log(y);   B = log(A);
x = log(x);

% -------------------------------------------------------------------------
A = 3; M = 7;
x = rand(1,100)*20;
y = A*x.^M;

plot(x,y,'ob');hold on;

function coefs = potfit(x,y)
    xs = log(x);
    ys = log(y);
    
    A = [xs(:) ones(size(x(:)))];
    coefs = pinv(A)*ys';
    
    M = coefs(1); B = coefs(2);
    A = exp(B);
    
    xr = 1:0.1:20;
    yestm = A * xr.^M;
    
    plot(xr,yestm,'r');hold off;
end