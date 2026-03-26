#!/bin/bash
path_entrada="$HOME/EPNro1/entrada"
path_procesado="$HOME/EPNro1/procesado"

contenido=$(ls -A $path_entrada)

if [ -z "$contenido" ]; then 
    exit
fi

find "$path_entrada" -type f -print0 | while IFS= read -r -d '' file; do
    while read LINE; do
        echo $LINE >> $FILENAME
    done < $file
    mv $file $path_procesado
done

#borro todo lo que no haya sido contemplado en el loop anterior.
rm -rf $path_entrada