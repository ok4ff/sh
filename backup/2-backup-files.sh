#!/usr/bin/env bash

. docker.conf

printf "\n"

echo "Синхранизация файлов контейнеров"
echo "Директория источник: $dirSourceFile"
echo "Директория получатель: $dirBackupFile"

for folder in ${folders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  rsync -azhv ${folderData[1]}  ${folderData[2]} 
  # rsync -azh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"

done

printf "\n"