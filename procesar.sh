#!/bin/bash

# Ruta de entrada y salida de las imágenes
input_dir="/home/franciscoryb/Escritorio/TpFinal/images"
output_dir="/home/franciscoryb/Escritorio/TpFinal/images2"

# Recorre todas las imágenes en el directorio de entrada
for file in "$input_dir"/*; do
  if [ -f "$file" ]; then
    # Obtiene el nombre del archivo sin la ruta
    filename=$(basename "$file")

    # Redimensiona la imagen con ImageMagick
    convert "$file" -resize 512x512! "$output_dir/$filename"

    echo "Imagen redimensionada: $filename"
  fi
done
