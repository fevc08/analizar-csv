# `analiza-csv.sh`
Este script analiza datos de inventario en archivos CSVs, muestra las filas cuya última columna está vacía. Además, cuenta cuantas filas por bodegas hay. Adicionalmente, para evitar reproceso, tiene unos filtros iniciales que indica si se está indicando el archivo a analizar y si el archivo a analizar es un archivo regular.

## Requisitos:
- `Bash`: para poder ejecutar el script
- `archivo.csv`: requiere que el archivo a analizar sea un archivo de texto con valores separados por coma, para que pueda hacer el análisis.

## Uso:
Para utilizar el script se debe escribir el siguiente comando, donde `ejemplo.csv` puede ser cualquier archivo de texto con valores separado por comas.
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
> NOTA: se debe revisar la estructura del CSV para que coincida que la segunda columna corresponde a Bodegas, de lo contrario va arrojar información que no corresponde a esta etiqueta.

Adicionalmente, se puede guardar el resultado y los errores en los archivos correspondientes con este comando:

```bash
bash analiza-csv.sh ejemplo.csv > reporte.txt 2> errores.txt
```
Así, se tendrían los archivos de resultados y el historial de errores.

> Ejemplo de comando con varios archivos:
> `bash analiza-csv.sh ejemplo.csv [ejemplo2.csv ...]`

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
