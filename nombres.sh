#!/bin/bash

# Lista de nombres
nombres=("Juan" "Pedro" "María" "Luis" "Ana" "Carlos" "Laura" "Pablo" "Sofía" "Javier")

# Ruta del directorio donde se encuentran los archivos
directorio="/home/franciscoryb/Escritorio/TpFinal/images"

# Recorre los archivos en el directorio
for archivo in "$directorio"/*; do
  if [ -f "$archivo" ]; then
    # Obtiene un nombre aleatorio de la lista
    nombre_aleatorio=${nombres[$RANDOM % ${#nombres[@]}]}

    # Obtiene la extensión del archivo
    extension="${archivo##*.}"

    # Genera un nuevo nombre para el archivo
    nuevo_nombre="${directorio}/${nombre_aleatorio}.${extension}"

    # Renombra el archivo
    mv "$archivo" "$nuevo_nombre"

    echo "Archivo renombrado: $archivo -> $nuevo_nombre"
  fi
done
