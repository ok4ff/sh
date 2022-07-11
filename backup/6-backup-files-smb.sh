#!/usr/bin/env bash

. backup.conf

printf "\n"

echo "Синхранизация файлов Samba $(date +"%H:%M:%S %d.%m.%Y")"
echo "Директория источник: $dirSMBFileSource"
echo "Директория получатель: $dirSMBFileBackup"

for folder in ${rsyncSMBFileFolders[@]}; do
  
  folderData=(${folder//;/ })

  printf " - rsync ${folderData[0]} ... "
  mkdir -p ${folderData[2]}
  rsync -azbh ${folderData[1]}  ${folderData[2]} 
  printf "OK $(date +"%H:%M:%S %d.%m.%Y")\n"
  
done

printf "\n"