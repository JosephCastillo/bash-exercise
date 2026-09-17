#!/bin/bash

# Script para organizar archivos en carpetas según su tipo

ORGANIZADOR(){
    DIRECTORIO=$1
    # Verificar si se proporcionó un argumento
    if [ -z "$DIRECTORIO" ]; then
        echo "⚠️  Error: Debes indicar la ruta de una carpeta."
        exit 1
    fi
    # Verificar si el directorio existe
    if [ ! -d "$DIRECTORIO" ]; then
        echo "🚨 Error: El directorio no existe."
        exit 1
    fi

    for archivo in "$DIRECTORIO"/*; do
        if [ -f "$archivo" ]; then

            shopt -s nocasematch

            if [[ "$archivo" == *.txt || "$archivo" == *.log || "$archivo" == *.csv ]]; then
                mkdir -p "./$DIRECTORIO/Textos"
                mv "$archivo" "./$DIRECTORIO/Textos/"
            elif [[ "$archivo" == *.jpg || "$archivo" == *.png ]]; then
                mkdir -p "./$DIRECTORIO/Imagenes"
                mv "$archivo" "./$DIRECTORIO/Imagenes/"
            elif [[ "$archivo" == *.pdf ]]; then
                mkdir -p "./$DIRECTORIO/Documentos"
                mv "$archivo" "./$DIRECTORIO/Documentos/"
            else
                mkdir -p "./$DIRECTORIO/Otros"
                mv "$archivo" "./$DIRECTORIO/Otros/"
            
            fi

            shopt -s nocasematch
            
        fi
    done

    echo "✅ Organización completada con éxito."
}

ORGANIZADOR $1