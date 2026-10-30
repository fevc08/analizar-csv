# `analiza-csv.sh`
Este script recibe uno o varios archivos de texto con valores separados por comas. Está compuesto por las funciones `contar_filas`, `filas_vacias`, `contar_por_columna` y `analizar`, que son las que dan el resultado. Adicionalmente, tiene dos comprobaciones como bloque if, para conocer los errores:

- Si no se pasa ningún archivo, muestra el uso y termina con código 1.
- Si un archivo no existe o no es un archivo regular, avisa por stderr, sigue con los demás y al final termina con código 1.

## Requisitos:
- `Bash`: para poder ejecutar el script
- `archivo.csv`: recibe uno o varios archivos de texto con valores separados por coma.

## Uso:
Para utilizar el script se debe escribir el siguiente comando, donde `ejemplo.csv` puede ser cualquier archivo de texto con valores separados por comas.
```bash
bash analiza-csv.sh ejemplo.csv
```
Output:
```bash
Análisis de ejemplo.csv
Número de filas: 10
Filas vacias:
6:2026-10-25,Bodega Oeste,Impresora,
Filas por bodega:
      4 Bodega Central
      3 Bodega Sur
      3 Bodega Oeste
Análisis sin problemas
```
> NOTA: El script cuenta por la segunda columna. Si tu archivo tiene otra estructura, el conteo será sobre esa columna.

Adicionalmente, se puede guardar el resultado y los errores en los archivos correspondientes con este comando:

```bash
bash analiza-csv.sh ejemplo.csv > reporte.txt 2> errores.txt
```
Así, se tendrían los archivos de resultados y el historial de errores.

Ejemplo de comando con varios archivos:

```bash
bash analiza-csv.sh ejemplo.csv ejemplo2.csv
```
Output:
```bash
Análisis de ejemplo.csv
Número de filas: 10
Filas vacias:
6:2026-10-25,Bodega Oeste,Impresora,
Filas por bodega:
      4 Bodega Central
      3 Bodega Sur
      3 Bodega Oeste
Análisis de ejemplo2.csv
Número de filas: 10
Filas vacias:
5:2026-10-14,Bodega Norte,Mesa,
Filas por bodega:
      4 Bodega Norte
      3 Bodega Sur
      3 Bodega Este
Análisis sin problemas
```

## Códigos de Salida:
|Código|Cuándo ocurre en el script|
| --- | --- |
| `0` |Todos los archivos se analizaron sin problemas|
| `1` |No se pasó ningún archivo, o algún archivo no existe o no es un archivo regular|

## Archivos Ignorados:
Para evitar que Git siga y los suba los archivos que no queremos en el repositorio, se crea el archivo `.gitignore` con las siguientes reglas:
```text
reporte.txt
errores.txt
```
