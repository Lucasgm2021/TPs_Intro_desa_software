#!/bin/bash
path_entrada="$HOME/EPNro1/entrada"
path_procesado="$HOME/EPNro1/procesado"

for file in "$path_entrada"/*; do
    if [ -d $file ]; then continue; fi
    while read LINE; do
        echo $LINE >> $FILENAME
    done < $file
    echo "$file added to $FILENAME"
done

mv "$path_entrada"/* $path_procesado
