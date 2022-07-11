#!/usr/bin/env bash

. docker.conf

printf "\n"

echo "Синхранизация файлов контейнеров"
echo "Директория источник: $dirDockerFileSource"
echo "Директория получатель: $dirDockerFileBackup"

for folder in ${rsyncDockerFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - rsync ${folderData[0]} ... \n"
  mkdir -p ${folderData[2]}
  # rsync -azhbv ${folderData[1]}  ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 

done

printf "\n"