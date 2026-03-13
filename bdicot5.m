function [x_min, f_min, x_his, fun, nombre] = bdicot5(a, b, tol, f)
    nombre = 'Busqueda dicotomica 5 puntos'; 
    k = 1;
    
    fun = [];
    x_his = []; 
    
    f_a = f(a); 
    f_b = f(b);

    m = (a + b)/2;
    f_m = f(m(1));
   
    fun = [fun, f_a, f_b, f_m]; 
    x_his = [x_his, a, b, m(1)]; 

    while b-a >= tol
        r = (a + m)/2; 
        f_r = f(r);
        s = (b + m)/2;
        f_s = f(s);

        fun = [fun, f_r, f_s]; 
        x_his = [x_his, r, s]; 

        lista_img= [f_a, f_r, f_m, f_s, f_b];
        lista_val = [a, r, m, s, b];
        [f_min, idx] = min(lista_img);
        x_min = lista_val(idx);
        
        if f_min == f_a || f_min == f_r
            b = m;  m = r; 
            f_b = f_m; f_m = f_r; 
        elseif f_min == f_m
            a = r;  b = s;
            f_a = f_r; f_b = f_s;
        else 
            a = m; m = s; 
            f_a = f_m; f_m = f_s; 
        end
        k = k+1;
    end
end