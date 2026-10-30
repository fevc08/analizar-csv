# `analiza-csv.sh`
Este script recibe uno o varios archivos de textos con valores separados por comas, muestra las filas cuya última columna está vacía y cuenta cuantas filas por valor hay en la segunda columna. Adicionalmente, para evitar reproceso, tiene dos filtros: una función de como se debe usar el archivo si no se escribe el archivo a analizar y otra función que verifica si el o los archivos a analizar no existem o no son regulares.

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
> NOTA: se debe revisar la estructura del CSV para que coincida que la segunda columna corresponde a Bodegas, de lo contrario va arrojar información que no corresponde a esta etiqueta.

Adicionalmente, se puede guardar el resultado y los errores en los archivos correspondientes con este comando:

```bash
bash analiza-csv.sh ejemplo.csv > reporte.txt 2> errores.txt
```
Así, se tendrían los archivos de resultados y el historial de errores.

> Ejemplo de comando con varios archivos:

```bash
bash analiza-csv.sh ejemplo.csv inventario.csv
Análisis de ejemplo.csv
Número de filas: 10
Filas vacias:
6:2026-10-25,Bodega Oeste,Impresora,
Filas por bodega:
      4 Bodega Central
      3 Bodega Sur
      3 Bodega Oeste
Análisis de inventario.csv
Número de filas: 10
Filas vacias:
6:2026-10-05,Bodega B,Laptop,
Filas por bodega:
      4 Bodega A
      3 Bodega C
      3 Bodega B
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
