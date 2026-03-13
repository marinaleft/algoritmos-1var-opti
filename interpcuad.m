function [x_min, f_min, x_his, fun, nombre] = interpcuad(a, b, c, tol, maxit, f)
    
    fa = f(a); fb = f(b); fc = f(c); 
    fun = [fa, fb, fc]; 
    x_his = [a, b, c]; 

    k = 1; 
    
    if (a < c && c < b ) && (fc < fa && fc < fb)
        nombre = 'Interpolacion cuadratica'; 
    else 
        nombre = false; 
        x_min = []; f_min = []; fun = []; x_his = []; 
        disp('No se cumplen los requisitos.');
        return; 
    end 

    v = c; fv = fc;

    while (b-a) >= tol
        num = (b^2 - c^2)*fa + (c^2 - a^2)*fb + (a^2 - b^2)*fc;
        den = (b - c)*fa + (c - a)*fb + (a - b)*fc;
        if abs(den) < 1e-12 
            v = c; 
            fv = fc;
            break; 
        end
        v = 0.5 * (num / den);
        fv = f(v); 
        x_his = [x_his, v]; 
        fun = [fun, fv];

        if (a<v && v<c)
            if fv>fc
                a = v; fa = fv; 
            else
                b = c; c = v; fb = fc; fc = fv; 
            end 
        else
            if fv>fc
                b = v; fb = fv; 
            else 
                a = c; c = v; fa = fc; fc = fv; 
            end 
        end
        if k == maxit
            disp('numero maximo de iteraciones sin convergencia');
            break; 
        end 
        k = k + 1; 

    end

    if fv <= fc 
        x_min = v; f_min = fv; 
    else 
        x_min = c; f_min = fc; 
    end 

end 