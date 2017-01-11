#!/bin/bash

  #   Script: escgen

  function usage {
     echo -e "\033[1;34mescgen\033[0m <valor_inferior> [<valor_superior>]"
     echo "   Generador de secuencias de escape octales: imprime todas las"
     echo "   secuencias de escape contenidas entre los valores menor y"
     echo "   mayor. Si no se proporciona el segundo valor, se imprimen"
     echo "   8 caracteres."
     echo "   1998 - Giles Orr, sin garantía."
     exit 1
  }

  if [ "$#" -eq "0" ]
  then
     echo -e "\033[1;31mPor favor incluya uno o dos valores.\033[0m"
     usage
  fi
  let lower_val=${1}
  if [ "$#" -eq "1" ]
  then
     # Si no hay dos valores, sacar 8 caracteres
     upper_val=$(echo -e "obase=8 \n ibase=8 \n $lower_val+10 \n quit" | bc)
  else
     let upper_val=${2}
  fi
  if [ "$#" -gt "2" ]
  then
     echo -e "\033[1;31mPor favor, incluya dos valores.\033[0m"
     echo
     usage
  fi
  if [ "${lower_val}" -gt "${upper_val}" ]
  then
     echo -e "\033[1;31m${lower_val} es mayor que ${upper_val}."
     echo
     usage
  fi
  if [ "${upper_val}" -gt "777" ]
     then
     echo -e "\033[1;31mLos valores no pueden superar 777.\033[0m"
     echo
     usage
  fi

  let i=$lower_val
  let line_count=1
  let limit=$upper_val
  while [ "$i" -lt "$limit" ]
  do
     octal_escape="\\$i"
     echo -en "$i:'$octal_escape' "
     if [ "$line_count" -gt "7" ]
     then
        echo
        #   Put a hard return in.
        let line_count=0
     fi
     let i=$(echo -e "obase=8 \n ibase=8 \n $i+1 \n quit" | bc)
     let line_count=$line_count+1
  done
  echo