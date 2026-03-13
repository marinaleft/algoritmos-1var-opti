function [x_min, f_min, x_his, fun, nombre] = secanteprot(a, b, xk, tol, maxit, f, df)
    
    nombre = 'metodo de la secante';

    paso = (b - a) * 0.01;
    if xk + paso <= b
        x_ant = xk + paso;
    else
        x_ant = xk - paso;
    end
    g_ant = df(x_ant);
    fk = f(xk);
    x_his = xk; fun = f(xk);
    
    for k = 1:maxit
        gk = df(xk);
        
        if abs(gk) < tol
            break;
        end
        
        hk = (gk - g_ant) / (xk - x_ant);
        
        if hk > 1e-12
            pk = -gk / hk;
        else
            pk = -gk;
        end
        
        if pk > 0
            alfa = min(1, (b - xk) / pk);
        elseif pk < 0
            alfa = min(1, (a - xk) / pk);
        else
            alfa = 0;
        end
        
        while f(xk + alfa * pk) >= fk && alfa > 1e-10
            alfa = alfa / 2;
        end
        
        x_ant = xk;
        g_ant = gk;
        xk = xk + alfa * pk;
        fk = f(xk);
        x_his = [x_his, xk]; fun = [fun, f(xk)];

    end
    
    x_min = xk;
    f_min = fk;
end