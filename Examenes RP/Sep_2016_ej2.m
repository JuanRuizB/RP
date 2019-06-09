clear all, close all, clc

load iris;
y = y+1;

for i = 1:max(y)
    m(:,i) = meanpat(x(:,find(y == i)));    
end

for i = 1:max(y)
    d(i,:) = d_euclid(x,m(:,i));
end

[~,clase] = min(d);