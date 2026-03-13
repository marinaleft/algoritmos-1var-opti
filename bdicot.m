function [x_min, f_min, x_his, fun, nombre] = bdicot(a, b, tol, d, f)
    nombre = 'Busqueda dicotomica';
    k = 1;
    
    
    fun = [];
    x_his = []; 
    
    f_a = f(a); 
    fun(1) = f_a;
    f_b = f(b); 
    fun(2) = f_b; 
    
    x_his = [x_his, a, b]; 

    while b-a >= tol
        
        u = d*(b-a); 
        r = (a+b)/2 - u;
        f_r = f(r); 
        s = (a+b)/2 + u; 
        f_s = f(s); 

        fun = [fun, f_r, f_s]; 
        x_his = [x_his, r, s];

        if f_r <= f_s 
            b = s; 
            f_b = f_s;
            

        else 
            a = r; 
            f_a = f_r;
            
        end

        k = k+1; 

    end 

    if f_a <= f_b
        x_min = a; 
        f_min = f_a; 
    else 
        x_min = b; 
        f_min = f_b; 
    end
   
end