# Algoritmos de Optimización en MATLAB

Colección de algoritmos numéricos para encontrar mínimos de funciones de una variable,
implementados en MATLAB.

## Descripción

Este repositorio contiene implementaciones de distintos métodos de búsqueda de mínimos,
desde métodos de intervalo hasta métodos basados en derivadas. El archivo `busqueda_completa.mlx`
permite analizar cualquier función de forma automática, encontrando mínimos, máximos y
puntos de inflexión con reporte y gráfica incluidos.

## Contenido

| Archivo | Descripción |
|---|---|
| `busqueda_completa.mlx` | Cuaderno de Live Editor para análisis completo de funciones |
| `pruebas.m` | Script que unifica y compara todos los algoritmos |
| `plotear.m` | Función de visualización de la búsqueda |

## Algoritmos implementados

- Búsqueda uniforme
- Búsqueda dicotómica
- Búsqueda dicotómica con 5 puntos
- Sección áurea
- Fibonacci
- Bisección
- Interpolación cuadrática
- Interpolación cúbica
- Newton protegido
- Secante protegida

## Uso

### Análisis completo de una función
Abrir `busqueda_completa.mlx` en el Live Editor de MATLAB y sustituir
la función deseada en la celda de configuración inicial. Para este archivo no es necesario tener los demás descargados. 

### Comparativa de métodos
Ejecutar `pruebas.m`. **Es necesario tener todos los archivos del repositorio
en la misma carpeta.**

### Visualización individual
La función `plotear` muestra para cada método el valle de búsqueda,
las evaluaciones realizadas y el mínimo encontrado.

## Requisitos

- MATLAB (probado en versión R2023 o superior)
- No requiere toolboxes adicionales

## Autor
Marina — Trabajo de prácticas, asignatura de Optimización
