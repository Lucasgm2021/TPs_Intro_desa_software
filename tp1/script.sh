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

crear_entorno(){
	if [ ! -d "$HOME/“EPNro1" ];then
		mkdir "$HOME/EPNro1"
		mkdir "$HOME/EPNro1/entrada"
		mkdir "$HOME/EPNro1/salida"
		mkdir "$HOME/EPNro1/procesado"
		echo "Creadas carpetas en $HOME/EPNro1"
		cp "consolidar.sh" "$HOME/EPNro1/consolidar.sh"
	else 
		echo "Ya existe la carpeta $HOME/EPNro1"
	fi
}

while true; do
	show_options
	echo -n "Ingresa un valor: "
	read value
#	if [ $((value)) == 6 ]; then
#		break
#	fi
	case $value in 
	  1)
	  echo "Creando entorno"
	  crear_entorno
	  ;;
  	  2)
	  echo "Corriendo proceso"
	  bash $HOME/EPNro1/consolidar.sh &
	  wait 
	  echo -e "Ejecutado.\n"
	  ;;
	  3)
	  echo "Mostrando alumnos ordenados por padron"
	  if [ -f $FILENAME ]; then 
	  	sort -t " " -n $FILENAME
	  fi
	  ;;
  	  4)
	  echo "Mostrando 10 notas mas altas"
	  if [ -f $FILENAME ]; then	
	  	sort -t " " -n -r $FILENAME | head -n 10
	  fi
	  ;;	  
	  5)
	  echo -n "Introduce un padron: "
	  read padron 
	  if [ -f $FILENAME ]; then	
		echo "Mostrando info del alumno de padron $padron"
		grep $padron $FILENAME
	  fi
	  ;;
  	  6)
	  echo "Saliendo..."
	  break
	  ;;
  	  *)
	  echo "El valor seleccionado es $value, no es una opcion valida"
	  ;;
	esac

done


