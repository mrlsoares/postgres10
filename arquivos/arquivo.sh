#!/bin/bash


#echo $VERIFICA_IMPORTAR

if [ $VERIFICA_IMPORTAR != "S" ]; then
  exit 0
fi


arquivos=$(find /docker/importar | grep .sql)
for arquivo in $arquivos
do
  #echo  $arquivo

  echo " ${arquivo} " 
  

done

for arquivo in $arquivos
do
  #echo  $arquivo

  echo " ${arquivo} " 
 

done
