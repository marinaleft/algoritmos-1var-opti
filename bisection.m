function [x_min, f_min, x_his, fun, nombre] = bisection(a, b, tol, f, df)

    ga = df(a);
    gb = df(b);
    fa = f(a);
    fb = f(b);

    x_his = []; fun = []; 

    x_his = [x_his, a, b]; fun = [fun, fa, fb]; 

    if (ga < 0 && gb > 0) || (ga < 0 && fb > fa) || (ga > 0 && gb > 0 && fb < fa)
        nombre = 'Algoritmo de biseccion';
    else
        nombre = false;
        x_min = []; f_min = []; x_his = [];
        disp('No se cumplen los requisitos.');
        return;
    end

    k = 1;
    while (b - a) >= tol
        c = 0.5 * (a + b);
        fc = f(c);
        gc = df(c);
        x_his = [x_his, c]; fun = [fun, fc]; 

        if (ga < 0 && gc > 0) || (ga < 0 && fc > fa) || (ga > 0 && gc > 0 && fc < fb)
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
            ga = gc;
        end
        k = k + 1;
    end

    if fa <= fb
        x_min = a; f_min = fa;
    else
        x_min = b; f_min = fb;
    end
end
