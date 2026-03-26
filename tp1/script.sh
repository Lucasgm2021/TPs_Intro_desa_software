#!/bin/bash

show_options(){
  echo -e "Elige una opcion: \n"

  opciones=("Crear entorno" "Correr proceso" "Mostrar alumnos ordenados por padron" "Mostrar 10 notas mas altas" "Ver detalle de alumno" "Salir")
  num=1
  for opt in "${opciones[@]}";do 
	echo "$num - $opt"
	num=$((num+1))

  done
  echo ""
}

show_options
echo -n "Ingresa un valor: "
read value

while  [[ "$value" != "6" ]]; do
	case $value in 
	  1)
	  echo "Creando entorno"
	  if [ ! -d "$HOME/EPNro1" ];then
		mkdir "$HOME/EPNro1"
		mkdir "$HOME/EPNro1/entrada"
		mkdir "$HOME/EPNro1/salida"
		mkdir "$HOME/EPNro1/procesado"
		echo "Creadas carpetas en $HOME/EPNro1"
		cp "consolidar.sh" "$HOME/EPNro1/consolidar.sh"
	  else 
		echo "Ya existe la carpeta $HOME/EPNro1"
	  fi
	  ;;
  	  2)
	  echo "Corriendo proceso"
	  if [ -f "$HOME/EPNro1/consolidar.sh" ]; then 
	  	bash $HOME/EPNro1/consolidar.sh & 
		echo -e "Ejecutado.\n"
	  else
	  	echo "No existe el archivo $HOME/EPNro1/consolidar.sh"
	  fi
	  ;;
	  3)
	  echo "Mostrando alumnos ordenados por padron"
	  if [ -f $FILENAME ]; then 
	  	sort -t " " -n -k 1 $FILENAME
	  else 
	  	echo "Archivo $FILENAME no encontrado"
	  fi
	  ;;
  	  4)
	  if [ -f $FILENAME ]; then	
	    echo "Mostrando 10 notas mas altas"
	  	sort -t " " -n -r -k 5 $FILENAME | head -n 10
	  else 
	  	echo "Archivo $FILENAME no encontrado"
	  fi
	  ;;	  
	  5)
	  echo -n "Introduce un padron: "
	  read padron 

	  if [[ ! $padron =~ ^[0-9]{5,6}$ ]]; then
		echo -e "\n$padron No es un padron valido.\n"
	  else 
		if [ -f $FILENAME ]; then	
			echo -e "\nMostrando info del alumno de padron: $padron.\n"
			grep -w $padron $FILENAME
			echo ""
		else 
			echo -e "\nArchivo $FILENAME no encontrado\n"
		fi	
	  fi
	  ;;
  	  *)
	  echo "El valor seleccionado es $value, no es una opcion valida"
	  ;;
	esac
	show_options
	echo -n "Ingresa un valor: "
	read value
done

while getopts "d" flag; do
    case "${flag}" in
        d)
		if [ -d "$HOME/EPNro1" ]; then
			rm -r "$HOME/EPNro1"
			echo "Entorno en EPNro1 eliminado."
		else 
			echo "No existe el entorno $HOME/EPNro1, no se eliminara nada"
		fi
		pkill -f "$HOME/EPNro1/consolidar.sh"
		echo -e "Proceso $HOME/EPNro1/consolidar.sh detenido si estaba ejecutandose.\n"
		;;
        *) echo "Flag desconocida" ;;
    esac
done
