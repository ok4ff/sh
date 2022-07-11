#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Синхранизация файлов контейнеров"
echo "Директория источник: $dirDockerFileSource"
echo "Директория получатель: $dirDockerFileBackup"

for folder in ${rsyncDockerFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  # rsync -azhbv ${folderData[1]}  ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"
  
done

printf "\n"