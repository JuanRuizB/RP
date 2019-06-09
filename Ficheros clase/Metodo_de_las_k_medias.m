close all;
clear all;
x = 2*rand(2,10000)-1;

ind = find(sum(x.^2)<1);
x = x(:,ind);

plot(x(1,:),x(2,:),'.');
axis equal;

k = 13;
c = x(:,1:k);

while(1)
    plot(x(1,:),x(2,:),'.g'), axis equal; hold on;
    plot(c(1,:),c(2,:),'ob','LineWidth',3);hold off;
    pause
    for j = 1:k
        d(j,:) = d_euclid(x,c(:,j));
    end
    [~,clase] = min(d);
    for j = 1:k
        c(:,j) = meanpat(x(:,find(clase==j)));
    end
    
end


