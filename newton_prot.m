function [x_min, f_min, x_his, fun, nombre] = newton_prot(a_ini, b_ini, xk, tol, maxit, f, df, d2f)
    nombre = 'Newton Protegido';
    
  
    a = a_ini; b = b_ini;
    ga = df(a); gb = df(b);
    fa = f(a); fb = f(b);
    
    if ~((ga < 0 && gb > 0) || (ga < 0 && fb > fa) || (ga > 0 && gb > 0 && fb < fa))
        disp('No se cumplen los requisitos del PASO 0.');
        x_min = []; f_min = []; x_his = []; fun = [];
        return;
    end
    
    fk = f(xk);
    k = 1;
    x_his = xk;
    fun = fk;

    while k <= maxit
        % --- PASO 1: Gradiente ---
        gk = df(xk);
        if abs(gk) < tol
            break; % Salimos del bucle para ir a la asignación final
        end
        
        hk = d2f(xk); 
        
        % --- PASO 2: Dirección p ---
        if hk > 0
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
        
     
        xk = xk + alfa * pk;
        fk = f(xk);
        
        x_his = [x_his, xk];
        fun = [fun, fk];
       
        if k == maxit
            disp('Se alcanzó el máximo de iteraciones.');
            break; 
        end
        
        k = k + 1;
    end
    
    % ASIGNACIÓN FINAL
    x_min = xk;
    f_min = fk;
end