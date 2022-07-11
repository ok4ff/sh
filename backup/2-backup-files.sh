#!/usr/bin/env bash

. .config

printf "\n"

echo "Синхранизация файлов контейнеров"
echo "Директория источник: $dirSource"
echo "Директория получатель: $dirBackup"

for folder in ${folders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  # rsync -azh ${folderData[1]}  ${folderData[2]} 
  # rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"

done

printf "\n"