#!/bin/bash

dir_base_origem_DLL=/docker/importar/DDL
dir_base_origem_DUMP=/docker/importar/DUMP
dir_base_destino_DDL=/docker/importados/DDL
dir_base_destino_DUMP=/docker/importados/DUMP

echo "Base "$POSTGRES_DB
psql -U postgres -d $POSTGRES_DB -f criarEsquemasnopostgres.sql
# procura os arquivos nao modificados ha mais de 365 dias em
# $dir_base_origem e move-os para $dir_base_destino
for arquivo in $(find "$dir_base_origem_DLL" -type f  -print ) ; do
  # determina o caminho relativo do novo arquivo
  novo_caminho_relativo="${arquivo#$dir_base_origem_DLL/}"
   
   psql -U postgres -d $POSTGRES_DB  -f  $arquivo
  # determina o diretorio de destino do novo arquivo
  dir_dest="$dir_base_destino_DDL/${novo_caminho_relativo%/*}"

  # cria o diretorio de destino caso nao exista
  [[ "$novo_caminho_relativo" == */* ]] && [ ! -d "$dir_dest" ] && mkdir -p "$dir_dest"

  # move o arquivo para $dir_base_destino
  #  (remova o 'echo' da linha abaixo pra realmente mover o arquivo)
  echo "$arquivo" "$dir_dest"
 
 #  echo "Destino" $dir_dest
 # echo "Relativo" $novo_caminho_relativo
  mv -f  "$arquivo"  "$dir_dest" 
done

for arquivo in $(find "$dir_base_origem_DUMP" -type f  -print ) ; do
   psql -U postgres -d $POSTGRES_DB  -f  $arquivo 
  #$(pg_restore --verbose --dname $POSTGRES_DB  "$arquivo") 
  # determina o caminho relativo do novo arquivo
  novo_caminho_relativo="${arquivo#$dir_base_origem_DUMP/}"
  # $(psql -U postgres -d $POSTGRES_DB  -f  "$arquivo" )
  # determina o diretorio de destino do novo arquivo
  dir_dest="$dir_base_destino_DUMP/${novo_caminho_relativo%/*}"

  # cria o diretorio de destino caso nao exista
  [[ "$novo_caminho_relativo" == */* ]] && [ ! -d "$dir_dest" ] && mkdir -p "$dir_dest"

  # move o arquivo para $dir_base_destino
  #  (remova o 'echo' da linha abaixo pra realmente mover o arquivo)
  echo "$arquivo" "$dir_dest"
  
  mv -f  "$arquivo"  "$dir_dest"
 #  echo "Destino" $dir_dest
 # echo "Relativo" $novo_caminho_relativo
  
done
