function celdas = dividirCeldas(bin)

   filas = dividirFilas(bin);
   
   for i = 1:size(filas,2)
       
        f = filas{i}';
        numeritos = dividirFilas(f);
        for j = 1:size(numeritos,2)
            celdas{i,j} = numeritos{j}';
        end
   end

end

function celdas = dividirFilas(bin)

    sizey = size(bin,1);
    sizex = size(bin,2);
    celda_act = 1;
        
    i = 2;
    while i <= sizey
        
        pos_act = 1;
        while (sizex-sum(bin(i,:))) < (0.98*sizex)
           celdas{celda_act}(pos_act,:) = bin(i,:);
           pos_act = pos_act + 1;
           i = i + 1;
        end
        if (sizex-sum(bin(i-1,:))) < (0.98*sizex)
            celda_act = celda_act + 1;
        end
        i = i + 1;
       
    end

end