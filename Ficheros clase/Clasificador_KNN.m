load iris

k = 5;

for i=1:size(x,2)
    d = d_euclid(x,x(:,i));
    [dummy,pos] = sort(d);
    yestim(i) = moda(y(pos(2:k+1)));
end

acierto = sum(y==yestim(i))/size(x,2)*100



for k = 1:50 % Aqui comprobamos para que valores de k tiene mas acierto, y 
    % nos fijamos que para k = 20 se consigue un acierto del 98% para este
    % problema.

for i=1:size(x,2)
    d = d_euclid(x,x(:,i));
    [dummy,pos] = sort(d);
    yestim(i) = moda(y(pos(2:k+1)));
end

acierto(k) = sum(y==yestim(i))/size(x,2)*100;

end