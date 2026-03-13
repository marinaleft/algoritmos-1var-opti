function [x_min, f_min, x, fun, nombre] = bunif(a, b, n, f)
    nombre = 'Busqueda uniforme'; 
    h = (b-a)/n;
    x = a:h:b;

    fun = f(x);

    [f_min, idx] = min(fun);
    x_min = x(idx); 

end 