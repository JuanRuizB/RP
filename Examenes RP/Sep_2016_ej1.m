clear all, close all, clc
rand('seed',0);
% Apartado A;

BD = rand(506,14)*0.5;

x = BD(1:506,1:13)';
y = BD(1:506,14)';

xtrn = x(:,1:400);
ytrn = y(:,1:400);
xtst = x(:,401:end);
ytst = y(:,401:end);

[error_trn,error_tst] = errores(xtrn,ytrn,xtst,ytst)

W = pca(x,2);
xs = W*x;

xtrn = xs(:,1:400);
ytrn = y(:,1:400);
xtst = xs(:,401:end);
ytst = y(:,401:end);

[error_trn,error_tst] = errores(xtrn,ytrn,xtst,ytst)

% Apartado B;
function [error_trn,error_tst] = errores(xtrn,ytrn,xtst,ytst)
k = size(xtrn,1);
A = [xtrn(1:k,:); ones(size(ytrn))]';
coefs = pinv(A)*ytrn';

aux = [xtst(1:k,:); ones(size(ytst))]';

yestim_trn = A*coefs;
yestim_tst = aux*coefs;
% yestim_tst = coefs(1)*xtst(1,:) + coefs(2)*xtst(2,:) + coefs(3)*xtst(3,:) + coefs(4)*xtst(4,:) + coefs(5)*xtst(5,:) + coefs(6)*xtst(6,:) + coefs(7)*xtst(7,:) + coefs(8)*xtst(8,:) + coefs(9)*xtst(9,:) + coefs(10)*xtst(10,:) + coefs(11)*xtst(11,:) + coefs(12)*xtst(12,:) + coefs(13)*xtst(13,:);

error_trn = sumsqr(ytrn - yestim_trn');
error_tst = sumsqr(ytst - yestim_tst');

end




