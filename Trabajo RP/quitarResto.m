function bin = quitarResto(bin)

    sizex = size(bin,2);
    sizey = size(bin,1);
    
    encontrado_ini = false;
    encontrado_fin = false;
    
    ini = 1;
    while ~encontrado_ini || ~encontrado_fin  %Eliminar arriba y abajo
        
        if (sum(bin(ini,:))) > (sizex*2/3) %Si hay una recta negra mas grande que 2/3 de la hoja
            encontrado_ini = true;
        else
            bin(ini,:) = [];
        end
        
        fin = size(bin, 1);
        
        if (sum(bin(fin,:))) > (sizex*2/3)
            encontrado_fin = true;
        else
            bin(fin,:) = [];
        end
        
    end
    
    encontrado_ini = false;
    encontrado_fin = false;
    
    while ~encontrado_ini || ~encontrado_fin
        
        if (sum(bin(:,ini))) > (sizey*2/3)
            encontrado_ini = true;
        else
            bin(:,ini) = [];
        end
        
        fin = size(bin,2);
        
        if (sum(bin(:,fin))) > (sizey*2/3)
            encontrado_fin = true;
        else
            bin(:,fin) = [];
        end
        
    end
    
end