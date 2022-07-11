#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%d.%m.%Y %H:%M:%S")] Синхранизация файлов Samba"
echo "[$(date +"%d.%m.%Y %H:%M:%S")] Директория источник: $dirSMBFileSource"
echo "[$(date +"%d.%m.%Y %H:%M:%S")] Директория получатель: $dirSMBFileBackup"

for folder in ${rsyncSMBFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf "[$(date +"%d.%m.%Y %H:%M:%S")]  - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"
  
done

printf "\n"