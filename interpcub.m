function [x_min, f_min, x_his, fun, nombre] = interpcub(a, b, tol, maxit, f, df)

    ga = df(a);
    gb = df(b);
    fa = f(a);
    fb = f(b);

    k = 1;

    x_his = [a, b]; fun = [fa, fb]; 

    if (ga < 0 && gb > 0) || (ga < 0 && fb > fa) || (ga > 0 && gb > 0 && fb < fa)
        nombre = 'Interpolacion cubica';
    else
        nombre = false;
        x_min = []; f_min = []; x_his = []; 
        disp('No se cumplen los requisitos.');
        return;
    end

    while b-a >= tol
        r = (3*((fa-fb)/(b-a))) + ga + gb; s = sqrt((r^2-ga*gb)); 
        v = a + (b-a)*((-ga+r+s)/(gb-ga+2*s)); fv = f(v); gv = df(v); 
        x_his = [x_his, v]; fun = [fun, fv]; 

        if (ga < 0 && gv > 0) || (ga < 0 && fv > fa) || (ga > 0 && gv > 0 && fv < fb)
            b = v; fb = fv; gb = gv; 
        else 
            a = v; fa = fv; ga = gv; 
        end 

        if k == maxit
            disp('numero maximo de iteraciones sin convergencia');
            break; 
        end 
        k = k + 1; 
    end 

    if fa<=fb
        x_min = a; f_min = fa; 
    else 
        x_min = b; f_min = fb; 
    end 
end