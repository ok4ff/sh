#!/usr/bin/env bash

. docker.conf

printf "\n"

echo "Синхранизация файлов контейнеров"
echo "Директория источник: $dirSourceFile"
echo "Директория получатель: $dirBackupFile"

for folder in ${folders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - rsync ${folderData[0]} ... \n"
  mkdir -p ${folderData[2]}
  # rsync -azhbv ${folderData[1]}  ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 

done

printf "\n"