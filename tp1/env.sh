#!/bin/bash
#Ejecutar con . ./env.sh. Ejecutar con bash env.sh porque crea una subshell y no se exportan las variables a la shell padre.
#Ver con printenv | grep FILENAME
export FILENAME="$HOME/EPNro1/salida/entradas.txt"
