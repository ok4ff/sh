#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "[$(date +"%H:%M:%S %d.%m.%Y")] Синхранизация файлов Samba"
echo "[$(date +"%H:%M:%S %d.%m.%Y")] Директория источник: $dirSMBFileSource"
echo "[$(date +"%H:%M:%S %d.%m.%Y")] Директория получатель: $dirSMBFileBackup"

for folder in ${rsyncSMBFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf "[$(date +"%H:%M:%S %d.%m.%Y")]  - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK\n"
  
done

printf "\n"