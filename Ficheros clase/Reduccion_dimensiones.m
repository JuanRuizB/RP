clear all, close all, clc

load iris

W = pca(x,3); %encuentra los parametros para minimizar las dimesiones a 3 

W = fisher(x,y,3) 


xprim = W*x;

x2 = pinv(W)*xprim;
