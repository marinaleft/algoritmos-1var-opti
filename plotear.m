function [] = plotear(x_min, f_min, x, fun, a, b, f, metodo, ax)
    x_curva = linspace(a, b, 500);
    y_curva = f(x_curva);
    n = length(fun);
    funcion = func2str(f);
    
    % Si no se pasa axes, crea figura propia
    if nargin < 9
        figure;
        set(gcf, 'Position', [100, 100, 900, 500]);
        ax = gca;
    end
    
    axes(ax);
    plot(ax, x_curva, y_curva);
    hold on;
    stem(ax, x, fun, 'Color', 'g', 'Marker', 'none');
    plot(ax, x_min, f_min, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    grid on;
    titulo_str = sprintf('%s\nEvals: %d', metodo, n);
    title(ax, titulo_str, 'FontSize', 8);
    xlabel(ax, 'x', 'FontSize', 7);
    ylabel(ax, 'f(x)', 'FontSize', 7);
    minimo_str = sprintf('x*=%.4f, f*=%.4f', x_min, f_min);
    legend(ax, 'f(x)', 'Búsqueda', minimo_str, 'FontSize', 6, 'Location', 'best');
    hold off;
end