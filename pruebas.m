clear; clc;

f = @(x) 2*cos(x) + cos(2*x);
df = @(x) -2*sin(x) - 2*sin(2*x);
d2f = @(x) -2*cos(x) -4*cos(2*x);
a = 1; b = 2.5;
n = 50;
tol = 1e-7; 
d = 0.25;
c = 2.1; 
x1_n = 1.01;
x1_sec = 2.3;
maxit = 50; 
eps = 1e-11;

[xm_bunif, fm_bunif, x_bunif, f_bunif, nombre_bunif] = bunif(a, b, n, f);
%plotear(xm_bunif, fm_bunif, x_bunif, f_bunif, a, b, f, nombre_bunif)

[xm_dicot, fm_dicot, x_dicot, f_dicot, nombre_dicot] = bdicot(a, b, tol, d, f);
%plotear(xm_dicot, fm_dicot, x_dicot, f_dicot, a, b, f, nombre_dicot)

[xm_dicot5, fm_dicot5, x_dicot5, f_dicot5, nombre_dicot5] = bdicot5(a, b, tol, f);
%plotear(xm_dicot5, fm_dicot5, x_dicot5, f_dicot5, a, b, f, nombre_dicot5)

[xm_sectaurea, fm_sectaurea, x_sectaurea, f_sectaurea, nombre_sectaurea] = sectaurea(a, b, tol, f);
%plotear(xm_sectaurea, fm_sectaurea, x_sectaurea, f_sectaurea, a, b, f, nombre_sectaurea);

[xm_fib, fm_fib, x_fib, f_fib, nombre_fib] = algfib(a, b, tol, d, f); 
%plotear(xm_fib, fm_fib, x_fib, f_fib, a, b, f, nombre_fib);

[xm_bis, fm_bis, x_bis, f_bis, nombre_bis] = bisection(a, b, tol, f, df);
%plotear(xm_bis, fm_bis, x_bis, f_bis, a, b, f, nombre_bis)

[xm_int2, fm_int2, x_int2, f_int2, nombre_int2] = interpcuad(a, b, c, tol, maxit, f); 
%plotear(xm_int2, fm_int2, x_int2, f_int2, a, b, f, nombre_int2)

[xm_int3, fm_int3, x_int3, f_int3, nombre_int3] = interpcub(a, b, tol, maxit, f, df); 
%plotear(xm_int3, fm_int3, x_int3, f_int3, a, b, f, nombre_int3)

[xm_nw, fm_nw, x_nw, f_nw, nombre_nw] = newton_prot(a, b, x1_n, tol, maxit, f, df, d2f); 
%plotear(xm_nw, fm_nw, x_nw, f_nw, a, b, f, nombre_nw)

[xm_sec, fm_sec, x_sec, f_sec, nombre_sec] = secanteprot(a, b, x1_sec, tol, maxit, f, df);
%plotear(xm_sec, fm_sec, x_sec,f_sec, a, b, f, nombre_sec)

metodos  = {nombre_bunif, nombre_dicot, nombre_dicot5, nombre_sectaurea, nombre_fib, ...
             nombre_bis, nombre_int2, nombre_int3, nombre_nw, nombre_sec};
x_mins   = [xm_bunif, xm_dicot, xm_dicot5, xm_sectaurea, xm_fib, ...
             xm_bis, xm_int2, xm_int3, xm_nw, xm_sec];
f_mins   = [fm_bunif, fm_dicot, fm_dicot5, fm_sectaurea, fm_fib, ...
             fm_bis, fm_int2, fm_int3, fm_nw, fm_sec];
n_evals  = [length(f_bunif), length(f_dicot), length(f_dicot5), length(f_sectaurea), length(f_fib), ...
             length(f_bis), length(f_int2), length(f_int3), length(f_nw), length(f_sec)];
todos_x   = {x_bunif, x_dicot, x_dicot5, x_sectaurea, x_fib, ...
             x_bis, x_int2, x_int3, x_nw, x_sec};
todos_fun = {f_bunif, f_dicot, f_dicot5, f_sectaurea, f_fib, ...
             f_bis, f_int2, f_int3, f_nw, f_sec};

% Tabla
TablaRes = table(metodos', x_mins', f_mins', n_evals', ...
    'VariableNames', {'Metodo', 'x_min', 'f_min', 'Evaluaciones'});
fprintf('\n--- COMPARATIVA DE MÉTODOS ---\n');
disp(TablaRes);

% Figura única
figure('Position', [50, 50, 1600, 900]);
n_cols = 5;
n_rows = ceil(length(metodos) / n_cols);

for i = 1:length(metodos)
    ax = subplot(n_rows, n_cols, i);
    plotear(x_mins(i), f_mins(i), todos_x{i}, todos_fun{i}, a, b, f, metodos{i}, ax);
end

sgtitle('Comparativa de métodos de optimización', 'FontSize', 12);