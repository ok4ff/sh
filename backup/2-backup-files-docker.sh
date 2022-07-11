#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Синхранизация файлов контейнеров $(date +"%H:%M:%S %d.%m.%Y")"
echo "[$(date +"%d.%m.%Y %H:%M:%S")] Директория источник: $dirDockerFileSource"
echo "[$(date +"%d.%m.%Y %H:%M:%S")] Директория получатель: $dirDockerFileBackup"

for folder in ${rsyncDockerFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf "[$(date +"%d.%m.%Y %H:%M:%S")]  - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  # rsync -azhbv ${folderData[1]}  ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"
  
done

printf "\n"