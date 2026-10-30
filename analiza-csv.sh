#!/usr/bin/env bash
# Validar que hay argumentos
if  [ "$#" -eq 0 ]; then
  echo "Uso: $0 archivo.csv [archivo.csv ...]" >&2
  exit 1
fi

# Contar filas
contar_filas() {
  tail -n +2 "$1" | grep -c ''
}

# Filas vacías
filas_vacias() {
  grep -n ',$' "$1"
}

# Contar por columna
contar_por_columna() {
  tail -n +2 "$1" | cut -d, -f2 | sort | uniq -c | sort -rn
}

# Analizar
analizar() {
  echo "Análisis de $1"
  echo "Número de filas: $(contar_filas "$1")"
  echo "Filas vacias:"
  filas_vacias "$1"
  echo "Filas por bodega:"
  contar_por_columna "$1"
}

# Inicializamos la variable fallos
fallos=0

# Realizamos el análisis
for f in "$@"; do
  if [ -f "$f" ]; then
    analizar "$f"
  else
    echo "El archivo $f no existe o no es un archivo regular" >&2
    fallos=$((fallos+1))
  fi
done

# Salida final según fallos
if [ "$fallos" -gt 0 ]; then
  echo "Archivos con problemas: $fallos" >&2
  exit 1
else
  echo "Análisis sin problemas"
  exit 0
fi
