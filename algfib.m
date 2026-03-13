function [x_min, f_min, x_his, fun, nombre] = algfib(a, b, tol, d, f)
    nombre = 'Busqueda de fibonacci';

    fib = [1, 1]; 
    while (b - a) / fib(end) >= tol
        fib(end+1) = fib(end) + fib(end-1);
    end
    m = length(fib);

    r = b - (fib(m-1)/fib(m))*(b-a);
    s = a + (fib(m-1)/fib(m))*(b-a);
    
    f_r = f(r); f_s = f(s);
    fun = [f_r, f_s]; x_his = [r, s];

    for k = 1:m-2
        if f_r <= f_s
            b = s; s = r; f_s = f_r; 

            if k < m-2
                r = b - (fib(m-k-1)/fib(m-k))*(b-a);
            else 
                r = s-d;
            end 
            f_r = f(r); 
            fun = [fun, f_r]; x_his = [x_his, r]; 
            
        else
            a = r; r = s; f_r = f_s;

            if k < m-2 
                s = a + (fib(m-k-1)/fib(m-k))*(b-a);
            else 
                s = r+d;
            end 
            f_s = f(s);
            fun = [fun, f_s]; x_his = [x_his, s]; 
        end 
    end
    if f_r <= f_s
        x_min = r;
        f_min = f_r; 
    else 
        x_min = s; 
        f_min = f_s; 
    end
end 

