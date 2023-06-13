#!/bin/bash

# Verifica si se ha proporcionado la cantidad de imágenes como argumento
if [ $# -eq 0 ]; then
  echo "Error: debe especificar la cantidad de imágenes a generar como argumento."
  exit 1
fi

# Cantidad de imágenes a generar
cantidad_imagenes=$1

# Directorio de destino para guardar las imágenes
directorio_destino="/home/franciscoryb/Escritorio/TpFinal/descargas"

# Verifica si el directorio de destino existe, si no, lo crea
if [ ! -d "$directorio_destino" ]; then
  mkdir -p "$directorio_destino"
fi

# Bucle para generar y descargar las imágenes
for ((i = 1; i <= cantidad_imagenes; i++)); do
  # Genera un nombre de archivo único basado en el índice de la imagen
  nombre_archivo="imagen_$i.jpg"

  # URL del servicio web para generar la imagen (reemplazar con la URL correspondiente)

  # URL inicial
  url="https://source.unsplash.com/random/900%C3%97700/?person"

  # Obtener la URL a la que redirige
  redirect_url=$(curl -s -o /dev/null -w "%{redirect_url}" "$url")

  # Descarga la imagen utilizando curl
  curl -o "$directorio_destino/$nombre_archivo" "$redirect_url"

  echo "Imagen descargada: $nombre_archivo"
done

