clear all, close all, clc;

%% Ejercicio 1
%Apartado A
load iris;
y = y+1;

solA = apartadoA(x(1:3,:),x(4,:))
solB = apartadoB(x(1:3,:),x(4,:),y)

error = Leave_one_out(x,y)

function coefs = apartadoA(x,y)

    A = [x(1:3,:);ones(size(y))]';
    b = y';

    coefs = pinv(A)*b; % Solucion Aparto A.

    yestA = A*coefs;
%     yestPRUEBA = coefs(1)*x(1,:)' + coefs(2)*x(2,:)' + coefs(3)*x(3,:)' + coefs(4);
%     Es lo mismo yestA que yestPRUEBA 
    

end
% Apartado B
function coefs = apartadoB(x,b,y)
    W = fisher(x,y,2);
    Fx = W*x;

    A = [Fx(1:2,:);ones(size(y))]';
    b = b';

    coefs = pinv(A)*b; % Solucion Aparto B.

    yestB = A*coefs;

end
% Apartado C

function error = Leave_one_out(x,y)
    W = fisher(x(1:3,:),y,2);
    xs = W*x(1:3,:);
    for i = 1:length(x)

        xtrn = x(1:3,:); xtrn(:,i) = [];
        ytrn = x(4,:); ytrn(:,i) = [];
        xtst = x(1:3,i);
        ytst = x(4,i);

        coefsA = apartadoA(xtrn,ytrn); 
        yestA = coefsA(1)*xtst(1) + coefsA(2)*xtst(2) + coefsA(3)*xtst(3) + coefsA(4);
        eA(i) = sumsqr(ytst - yestA);
%         rA = ytst - yestA;
%         eA(i) = rA'*rA;
        
        
        xtrn = xs(1:2,:); xtrn(:,i) = [];
        ytrn = x(4,:);    ytrn(:,i) = [];
        xtst = xs(1:2,i);
        ytst = x(4,i);
        
        A = [xtrn(1:2,:);ones(size(xtrn))]';
        b = ytrn';

        coefsB = pinv(A)*b;
        
        yestB = coefsB(1)*xtst(1) + coefsB(2)*xtst(2) + coefsB(3);
        eB(i) = sumsqr(ytst - yestB);
%         rB = ytst - yestB;
%         eB(i) = rB'*rB;

    end
    error = [mean(eA); mean(eB)];
end
