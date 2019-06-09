
function D = Euclidea(M,V)
    for n=1:1:(size(V,2))
       s = norm( M(:,n) - V);
       d = min(s);
    end
    D = M(:,find(d));
end