function [x_min, f_min, x_his, fun, nombre] = sectaurea(a, b, tol, f)
    nombre = 'seccion aurea'; 
    k = 1;
    alpha = (sqrt(5)-1)/2; 

    r = a + (1-alpha)*(b-a); s = a + alpha*(b-a); 
    f_r = f(r); f_s = f(s);
    
    fun = []; 
    x_his = []; 
    
    fun = [fun, f_r, f_s]; x_his = [x_his, r, s]; 
    
    while b-a >= tol 
        if f_r <= f_s
            b = s; s = r; f_s = f_r;
            r = a + (1-alpha)*(b-a); f_r = f(r);
            fun = [fun, f_r]; x_his = [x_his, r]; 
        else 
            a = r; r = s; f_r = f_s; 
            s = a +alpha*(b-a); f_s = f(s); 
            fun = [fun, f_s]; x_his = [x_his, s]; 
        end
        k = k +1; 
        
    end
    
    if f_r <= f_s
        x_min = r; f_min = f_r;
    else 
        x_min = s; f_min = f_s; 
    end

end 