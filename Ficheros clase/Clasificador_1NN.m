load iris

for i=1:size(x,2)
    d = d_euclid(x,x(:,i));
    [dummy,pos] = sort(d);
    yestim(i) = y(pos(2));
end

acierto = sum(y==yestim(i))/size(x,2)*100